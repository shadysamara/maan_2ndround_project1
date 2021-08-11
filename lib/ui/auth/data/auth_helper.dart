import 'package:firebase_auth/firebase_auth.dart';
import 'package:maan1/ui/auth/models/register_request.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  signup(RegisterRequest registerRequest) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: registerRequest.email, password: registerRequest.password);
      print(await userCredential.user.getIdToken());
      print(userCredential.user.uid);
    } on Exception catch (e) {
      print(e);
    }
  }

  login(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      print(await userCredential.user.getIdToken());
      print(userCredential.user.uid);
    } on Exception catch (e) {
      print(e);
    }
  }

  resetPassword(String email) {
    firebaseAuth.sendPasswordResetEmail(email: email);
  }

  verifyEmail(String email) {
    firebaseAuth.currentUser.sendEmailVerification();
  }

  logout() {
    firebaseAuth.signOut();
  }
}
