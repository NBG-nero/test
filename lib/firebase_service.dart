import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'authservice.dart';

class FirebaseService {
  static addUser(name, email) async {
    final db = FirebaseFirestore.instance;
    final pEmail = await AuthService().getCurrentEmail();

    log('firebase function was called');
    await db
        .collection('userData')
        .doc(pEmail)
        .set({'name': name, 'email': email}).catchError((e) {
      log('firebase function did not work');
    });
    // await db.collection('userData').doc()
  }
}
