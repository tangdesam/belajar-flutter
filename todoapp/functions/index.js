const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const {getFirestore, Timestamp, FieldValue} = require("firebase-admin/firestore");
 // Create and deploy your first functions
 // https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.saveFCMToken = functions.https.onRequest(async(request, response) => {
        // supaya ga error CORS, supaya bisa cross origin
        response.set('Access-Controll-Allow-Origin', "*");
        response.set('Access-Controll-Allow-Method', 'GET,POST');

        const fcmToken = request.query.fcm;
        const db = getFirestore();
        const tokenRef = db.collection('fcm').doc('token');
        const token1 = await tokenRef.get(); // pakai await krn ada kemungkinan nunggu dari server
        const token = token1.data();
        if (token["tokenList"].indexOf(fcmToken) < 0) {
            // save / push token jika belum ada
            token["tokenList"].push(fcmToken);
        }

        // kirim balik list token ke server
        const res = await db.collection('fcm').doc('token').set(token);
        response.json({result: fcmToken});
    }
);

// contoh kirim notif ke semua pengguna
exports.sendFCM = functions.https.onRequest(async(request, response) {
        // supaya ga error CORS, supaya bisa cross origin
        response.set('Access-Controll-Allow-Origin', "*");
        response.set('Access-Controll-Allow-Method', 'GET,POST');
        const message = request.query.message;
        const db = getFirestore();

        const tokenRef = db.collection('fcm').doc('token');
        const token1 = await tokenRef.get(); // pakai await krn ada kemungkinan nunggu dari server
        const token = token1.data();
        const tokenList = token["tokenList"];
        for (i=0; i<tokenList.length; i++) {
            const fcmToken = tokenList[i];
            const payLoad = {
                token: fcmToken,
                notification: {
                    title: 'global reminder',
                    body: message
                },
                data: {
                    body: message,
                }
            };
            admin.messaging().send(payLoad).then((response) => {
                    console.log('>>> Success send message: ', response);
                    return {success: true};
                }
            ).catch((error) => {
                    return {error: error.code};
                }
            );
        }
        response.json({result: message});

    }
);