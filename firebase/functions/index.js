const functions = require("firebase-functions/v1");
const admin = require("firebase-admin");

admin.initializeApp();

exports.createUser = functions.auth.user().onCreate((user) => {
  const nickname = user.displayName || "Anonymous";
  const uid = user.uid;

  return createUser(nickname, uid);
});

async function createUser(nickname, uid) {
  await admin.database().ref(`/users/${uid}`).set({
    nickname: nickname,
    health_positive_cnt: 0,
    health_negative_cnt: 0,
    money_positive_cnt: 0,
    money_negative_cnt: 0,
    mental_positive_cnt: 0,
    mental_negative_cnt: 0,
    total_carbon_dioxide: 0.0,
  });

  functions.logger.log("User created: ", uid);
  return null;
}
