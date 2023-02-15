import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/authservice.dart';
import 'package:testapp/firebase_service.dart';
import 'package:testapp/login.dart';

import 'homescreen.dart';

class AuthProvider extends ChangeNotifier {
  bool autoValidate = false;

  setAutoValidate(value) {
    autoValidate = value;
    notifyListeners();
  }

  Future signup(name, email, password, context) async {
    try {
      log("sign up was called");
      await AuthService()
          .createUserWithEmailAndPassWord(name, email, password)
          .then((data) {
        FirebaseService.addUser(name, email);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
        log('signup successful');
        notifyListeners();
      });
    } catch (e) {
      log(e.toString());
    }
  }

  login(email, password, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      log('login was called');
      await AuthService()
          .signInWithEmailAndPassword(email, password)
          .then((val) {
        prefs.setString('email', email);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Homescreen()));
        log('login successful');
        notifyListeners();
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
