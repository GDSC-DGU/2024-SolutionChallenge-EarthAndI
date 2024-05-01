const functions = require('firebase-functions');
const admin = require('firebase-admin');
const express = require("express");

admin.initializeApp({
  locationId: 'asia-northeast3',
});

/* --------------------------------------------------------------------------------------------- */
/* -------------------------------------- Trigger Functions ------------------------------------ */
/* --------------------------------------------------------------------------------------------- */
const db = admin.firestore();

exports.signUp = functions.region('asia-northeast3').auth.user().onCreate((user) => {
    const { uid, displayName } = user;

    const nicknameTemp = displayName.replace(/\s/g, '');
    const nickname = nicknameTemp.length < 15 ? nicknameTemp : nicknameTemp.substring(0, 15);

    // 존재하는지 확인
    return admin.firestore().collection('users').doc(uid).get()
        .then((docSnapshot) => {
            if (docSnapshot.exists) {
                return;
            } else {
                admin.firestore().collection('users').doc(uid).set({
                    "id": uid,
                    "nickname": nickname,
                    "total_positive_delta_co2": 0.0,
                    "total_negative_delta_co2": 0.0,
                    "health_condition": true,
                    "mental_condition": true,
                    "cash_condition": true,
                    "is_notification_active": true,
                });

                admin.firestore().collection('follows').doc(uid).set({
                    "followers": [],
                    "followings": [],
                });
            }
        })
        .catch((error) => {
            console.error("Error checking document existence:", error);
            throw new functions.https.HttpsError('internal', 'Error checking document existence', error);
        });
});

exports.withdrawal = functions.region('asia-northeast3').auth.user().onDelete(async (user) => {
    const { uid } = user;

    // follows에서 following, follower를 들고온다
    const follows = await admin.firestore().collection('follows').doc(uid).get();

    const followingIds = follows.data().followings;
    const followerIds = follows.data().followers;

    // 사라질 값이니 각 문서에 가서 삭제한다
    followingIds.forEach(async (id) => {
        const followingUserDoc = await admin.firestore().collection('follows').doc(id).get();

        followingUserDoc.ref.update({
            "followers": admin.firestore.FieldValue.arrayRemove(uid),
        });
    });

    followerIds.forEach(async (id) => {
        const followerUserDoc = await admin.firestore().collection('follows').doc(id).get();

        followerUserDoc.ref.update({
            "followings": admin.firestore.FieldValue.arrayRemove(uid),
        });
    });

    // user document를 삭제한다
    await admin.firestore().collection('users').doc(uid).delete();
    await admin.firestore().collection('follows').doc(uid).delete();

    return;
});

exports.updateFollows = functions.region('asia-northeast3').firestore.document('follows/{userId}').onUpdate(async (snap, context) => {
    if (context.authType === 'ADMIN') {
        return;
    }

    // followings를 가져온다
    const before = snap.before.data();
    const after = snap.after.data();

    // before의 followings와 after의 followings를 비교한다
    const followingsBefore = before.followings;
    const followingsAfter = after.followings;

    // followingsBefore와 followingsAfter를 비교하여 삭제되거나 추가된 followId를 찾는다
    const isCreated = followingsBefore.length < followingsAfter.length;
    const followingId = isCreated ? followingsAfter.find(x => !followingsBefore.includes(x)) : followingsBefore.find(x => !followingsAfter.includes(x));

    if (followingId === undefined) {
        return;
    }

    // 추가되는 경우라면 follower의 followers에 추가한다
    if (isCreated) {
        admin.firestore().collection('follows').doc(followingId).update({
            "followers": admin.firestore.FieldValue.arrayUnion(context.params.userId),
        });

        // 만약 하루 이내에 이미 팔로우한 경우에는 notification을 보내지 않는다
        const yesterday = new Date(Date.now() - 86400000); // 24시간 전의 시간을 계산합니다.

        const notificationLogs = await admin.firestore().collection('notification_logs')
            .where("from_user_id", "==", context.params.userId)
            .where("to_user_id", "==", followingId)
            .get();

        // type이 follow이고 하루 이내에 이미 팔로우한 경우에는 notification을 보내지 않는다
        const postprocess = notificationLogs.docs.filter((doc) => {
            return doc.data().type === "follow" && doc.data().timestamp.toDate() > yesterday;
        });

        if (postprocess.length === 0) {
            const followingUser = await admin.firestore().collection('users').doc(followingId).get()
            const currentUser = await admin.firestore().collection('users').doc(context.params.userId).get()

            if (followingUser.data().is_notification_active === false) {
                return;
            }
    
            // notification logs에 추가
            admin.firestore().collection('notification_logs').add({
                "from_user_id": context.params.userId,
                "to_user_id": followingId,
                "type": "follow",
                "timestamp": admin.firestore.FieldValue.serverTimestamp(),
            });
    
            const deviceToken = followingUser.data()["device_token"];
            const deviceLanguage = followingUser.data()["device_language"];
            const notificationBody = deviceLanguage === "ko" ? (currentUser.data().nickname + "님이 팔로우했습니다.") : (currentUser.data().nickname + " followed you.");
    
            // fcm 보내기
            admin.messaging().send({
                token: deviceToken,
                notification: {
                    title: "E & I",
                    body: notificationBody,
                },
                data: {
                    type: "follow",
                    userId: context.params.userId,
                },
                apns: {
                    payload: {
                        aps: {
                            sound: "default",
                        },
                    },
                },
            });
        }

        return;
    } else {
        admin.firestore().collection('follows').doc(followingId).update({
            "followers": admin.firestore.FieldValue.arrayRemove(context.params.userId),
        });

        return;
    }
});

/* --------------------------------------------------------------------------------------------- */
/* ---------------------------------------- Https Functions ------------------------------------ */
/* --------------------------------------------------------------------------------------------- */
const app = express();
const api = express.Router();
app.use(express.json());
app.use('/v1', api);

exports.api = functions.region('asia-northeast3').https.onRequest(app);

// 00 ~ 06 -> _actionGroups[0]
// 06 ~ 12 -> _actionGroups[1]
// 12 ~ 18 -> _actionGroups[2]
// 18 ~ 24 -> _actionGroups[3]
const actionGroups = [
    [],
    ["meal", "publicTransportation", "sns"],
    ["meal", "tumbler", "stairs", "recycle"],
    ["optimalTemperature", "meal", "sns", "waterUsage", "standbyPower"],
];

api.post('/serving/actions', async (req, res) => {
    // request의 header에 있는 authorization을 확인한다
    let uid;
    let requestNickname;
    const { data } = req.body;

    try {
        const idToken = req.headers.authorization.split('Bearer ')[1];
        const decodedToken = await admin.auth().verifyIdToken(idToken);
        uid = decodedToken.uid;
    } catch (error) {
        res.status(401).json();
        return;
    }

    requestNickname = (await admin.firestore().collection('users').doc(uid).get()).data().nickname;

    const actionHistories = data.map((item) => {
        return {
            "action": item.action,
            "question": item.question,
            "answer": item.answer,
            "created_at": new Date(item.created_at).toISOString(),
        };
    });

    const now = new Date(Date.now() + 32400000);
    const hour = now.getHours();
    const actionGroupIndex = Math.floor(hour / 6);
    const actionGroup = actionGroups[actionGroupIndex];


    if (actionGroupIndex === 0) {
        console.log("dawn");
        res.status(400).json();
        return;
    }

    // 각각을 비교해서 모두 존재하는지 확인한다.
    const isAllExist = actionGroup.every((action) => {
        return actionHistories.some((history) => {
            return history.action === action;
        });
    });

    // 만약 모두 존재하지 않는다면 400 Bad Request를 반환한다.
    if (!isAllExist) {
        console.log("not all exist");
        res.status(400).json();
        return;
    }

    // 모두 있다면 현재 유저의 follower들에게 notification을 보낸다
    const followers = await admin.firestore().collection('follows').doc(uid).get();
    const followerIds = followers.data().followers;

    // 만약 현재 Group의 시간에 이미 같은 action group을 수행한 경우에는 notification을 보내지 않는다
    const startAt = new Date(now.getFullYear(), now.getMonth(), now.getDate(), actionGroupIndex * 6, 0, 0);
    const endAt = new Date(now.getFullYear(), now.getMonth(), now.getDate(), (actionGroupIndex + 1) * 6 -1, 59, 59);

    const notificationLogs = await admin.firestore().collection('notification_logs')
        .where("from_user_id", "==", uid)
        .where("to_user_id", "in", followerIds)
        .get();

    // 0이면 dawn, 1이면 morning, 2이면 afternoon, 3이면 evening인 string을 만든다
    // action_dawn, action_morning, action_afternoon, action_evening
    const type = "action_" + (actionGroupIndex === 0 ? "dawn" : (actionGroupIndex === 1 ? "morning" : (actionGroupIndex === 2 ? "afternoon" : "evening")));
    const postprocess = notificationLogs.docs.filter((doc) => {
        return doc.data().type === type && doc.data().timestamp.toDate() > startAt && doc.data().timestamp.toDate() < endAt;
    });

    // 보낼 id들만 추린다
    const notificationIds = followerIds.filter((id) => {
        return !postprocess.some((doc) => {
            return doc.data().to_user_id === id;
        });
    });

    // 위 id들을 이용하여 notification을 보낸다
    if (notificationIds.length === 0) {
        res.json({ result: "success" });
        return;
    }

    const followersData = await admin.firestore().collection('users').where(admin.firestore.FieldPath.documentId(), 'in', notificationIds).get();

    for (const doc of followersData.docs) {
        const nickname = requestNickname;
        const deviceToken = doc.data()["device_token"];
        const deviceLanguage = doc.data()["device_language"];
        const notificationBody = deviceLanguage === "ko" ? nickname + "(이)가 새로운 행동들을 했습니다." : nickname + " has done a new actions.";

        if (doc.data().is_notification_active === false || deviceToken === null || deviceToken === "" || deviceToken === undefined) {
            continue;
        }

        // notification logs에 추가
        admin.firestore().collection('notification_logs').add({
            "from_user_id": uid,
            "to_user_id": doc.id,
            "type": type,
            "timestamp": admin.firestore.FieldValue.serverTimestamp(),
        });

        // fcm 보내기
        admin.messaging().send({
            token: deviceToken,
            notification: {
                title: "E & I",
                body: notificationBody,
            },
            data: {
                type: type,
                userId: uid,
            },
            apns: {
                payload: {
                    aps: {
                        sound: "default",
                    },
                },
            },
        });
    }


    res.json({ result: "success" });
});
