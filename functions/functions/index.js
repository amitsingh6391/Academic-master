//const functions = require('firebase-functions');

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });



const functions = require('firebase-functions');

const admin = require('firebase-admin')
admin.initializeApp()

exports.sendNotification = functions.firestore
.document("userstoken/{user}/notifications/{notification}")
.onCreate(async (snapshot, context)=> {

    try {
        
        const notificationDocument = snapshot.data()
        const uid = context.params.user;

        const notificationMessage = notificationDocument.message;
        const notificationTitle = notificationDocument.title;

        const userDoc = await admin.firestore().collection("userstoken").doc(uid).get();

        const fcmToken = userDoc.data().fcmToken

        const message = {
            "notification": {
                title: notificationTitle,
                body: notificationMessage
            },
            token: fcmToken
        }
        

        // send to topic
        //admin.messaging().sendToTopic('topic-name')


        // send notification to device

      

        return admin.messaging().send(message)

    } catch (error) {
        console.log(error)
    }

})


