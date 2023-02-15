import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => auth.idTokenChanges();
   Future getCurrentEmail() async {
    return auth.currentUser?.email;
  }

Future <String?> createUserWithEmailAndPassWord( 
  String? name, String email, String password
) async{  
  final User? currentUser = (await auth.createUserWithEmailAndPassword( 
    email: email, password: password
  )).user; 
  log('auth signup function called');
  var updateInfo = UserInfo({"email": email});
  name = updateInfo.displayName; 
  await currentUser?.updateDisplayName(name);
  await currentUser?.reload(); 
  return currentUser?.uid;



}

Future<String> signInWithEmailAndPassword(String email,String password)async { 
  log('auth login function called'); 
  return ((await auth.signInWithEmailAndPassword( 
    email:email, password:password)
  ).user)!.uid;
}


  Future signOut() async {
    return auth.signOut();
  }
}
