const functions = require("firebase-functions/v1");
const admin = require("firebase-admin");

admin.initializeApp();

exports.createUser = functions.auth.user().onCreate((user) => {
  const displayName = user.displayName || "Anonymous";
  const uid = user.uid;

  return createUser(displayName, uid);
});

async function createUser(displayName, uid) {
  await admin.database().ref(`/users/${uid}`).set({
    displayName: displayName,
    uid: uid,
  });

  functions.logger.log("User created: ", uid);
  return null;
}
