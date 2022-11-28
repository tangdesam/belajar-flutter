const functions = require("firebase-functions");

 // Create and deploy your first functions
 // https://firebase.google.com/docs/functions/get-started

 exports.helloWorld = functions.https.onRequest((request, response) => {
   functions.logger.info("Hello logs!", {structuredData: true});
   response.send("Hello from Firebase!");
 });

//exports.saveFCMToken = functions.https.onRequest(async(request, response) => {
//        response.set('Access-Controll-Allow-Origin', "*")
//        response.set('Access-Controll-Allow-Method', 'GET,POST')
//        const fcmToken = request.query.fcm;
//        const db = getFirestore();
//        const tokenRef = db.collection('fcm').doc('token')
//        const token1 = await tokenRef.get(); // pakai await krn ada kemungkinan nunggu dari server
//        const token = token1.data();
//        if (token["tokenList"].indexOf(fcmToken) < 0) {
//            // save / push token jika belum ada
//            token["tokenList"].push(fcmToken)
//        }
//    }
//)