import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/data/firestore_helper.dart';
import 'package:maan1/ui/auth/models/register_request.dart';
import 'package:maan1/ui/helpers/custom_dialoug.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  signup(RegisterRequest registerRequest) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: registerRequest.email, password: registerRequest.password);
      String id = userCredential.user.uid;
      registerRequest.id = id;
      verifyEmail(registerRequest.email);
      FirestoreHelper.firestoreHelper.saveUserInFirestore(registerRequest);
    } on Exception catch (e) {
      print(e);
    }
  }

  login(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      FirestoreHelper.firestoreHelper
          .getUserFromFirestore(userCredential.user.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialoug.customDialoug.showCustomDialoug(
            context, 'Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomDialoug.customDialoug.showCustomDialoug(
            context, 'Error', 'Wrong password provided for that user.');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  resetPassword(String email) {
    firebaseAuth.sendPasswordResetEmail(email: 'shady.samara@gmail.com');
  }

  verifyEmail(String email) {
    firebaseAuth.currentUser.sendEmailVerification();
  }

  logout() {
    firebaseAuth.signOut();
  }
}
