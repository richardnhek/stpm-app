import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCLWgWEsuVx8J48UJ_k7sRUCX-7RQmHLNw",
            authDomain: "stpmnewsapp.firebaseapp.com",
            projectId: "stpmnewsapp",
            storageBucket: "stpmnewsapp.appspot.com",
            messagingSenderId: "974642028810",
            appId: "1:974642028810:web:5505b107fed806a7f75af3",
            measurementId: "G-2GF40N4C7Q"));
  } else {
    await Firebase.initializeApp();
  }
}
