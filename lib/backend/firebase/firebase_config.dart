import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAiaWOwmJTCeejkJCvJloga-D-g90lTFOc",
            authDomain: "put-u-on-dev-2fd6e.firebaseapp.com",
            projectId: "put-u-on-dev-2fd6e",
            storageBucket: "put-u-on-dev-2fd6e.firebasestorage.app",
            messagingSenderId: "158867891040",
            appId: "1:158867891040:web:047b880fb13342add93405",
            measurementId: "G-J2P32MV8X7"));
  } else {
    await Firebase.initializeApp();
  }
}
