import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAkkO_Gf_aJbEci4lrJA-BGCWlZXpaAN6E",
            authDomain: "put-u-on-v87ycz.firebaseapp.com",
            projectId: "put-u-on-v87ycz",
            storageBucket: "put-u-on-v87ycz.firebasestorage.app",
            messagingSenderId: "562385796089",
            appId: "1:562385796089:web:11f745bc354a5b997f1b28",
            measurementId: "G-P2M6WPXZFZ"));
  } else {
    await Firebase.initializeApp();
  }
}
