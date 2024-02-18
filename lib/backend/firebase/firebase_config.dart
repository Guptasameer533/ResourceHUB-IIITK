import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB9jcxaHDe1-kEbj57se7vqbP1l0RKYP0c",
            authDomain: "app1-j5qsw4.firebaseapp.com",
            projectId: "app1-j5qsw4",
            storageBucket: "app1-j5qsw4.appspot.com",
            messagingSenderId: "679060132519",
            appId: "1:679060132519:web:0dd25ccdfe1f143c4c0182"));
  } else {
    await Firebase.initializeApp();
  }
}
