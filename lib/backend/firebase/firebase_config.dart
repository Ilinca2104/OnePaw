import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB6tuFTNE-hBfjVlqF48A9hDFE8tBI21i8",
            authDomain: "one-paw-n3dwpw.firebaseapp.com",
            projectId: "one-paw-n3dwpw",
            storageBucket: "one-paw-n3dwpw.appspot.com",
            messagingSenderId: "938990744068",
            appId: "1:938990744068:web:efe78cdcfce13230ddbb51"));
  } else {
    await Firebase.initializeApp();
  }
}
