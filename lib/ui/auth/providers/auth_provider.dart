import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/data/auth_helper.dart';
import 'package:maan1/ui/auth/data/firestore_helper.dart';
import 'package:maan1/ui/auth/models/register_request.dart';
import 'package:maan1/ui/auth/ui/register_page.dart';
import 'package:maan1/ui/helpers/route_helper.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Gender selectedGender;
  saveGender(Gender gender) {
    this.selectedGender = gender;
    notifyListeners();
  }

  nullValidate(String v) {
    if (v == null || v.length == 0) {
      return 'Required Field';
    }
  }

  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  registerNewUser() async {
    if (registerKey.currentState.validate()) {
      RegisterRequest registerRequest = RegisterRequest(
          city: cityController.text,
          country: countryController.text,
          userName: userNameController.text,
          email: emailController.text,
          password: passwordController.text,
          gender: selectedGender,
          phoneNumber: phoneController.text);
      UserCredential userCredential = await signup(registerRequest);
      setUserInFirestore(registerRequest);
      await verifyEmail();
      logout();
      RouteHelper.routeHelper
          .showCustomDialoug('please chech your email to verify your account');
    }
  }

  Future<UserCredential> signup(RegisterRequest registerRequest) async {
    UserCredential userCredential =
        await AuthHelper.authHelper.signup(registerRequest);
    return userCredential;
  }

  login(String email, String password) async {
    UserCredential userCredential =
        await AuthHelper.authHelper.login(email, password);
  }

  resetPassword(String email) async {
    AuthHelper.authHelper.resetPassword(email);
  }

  verifyEmail() async {
    AuthHelper.authHelper.verifyEmail();
  }

  logout() async {
    AuthHelper.authHelper.logout();
  }

  getUserFormFirestore(String userId) async {
    FirestoreHelper.firestoreHelper.getUserFromFirestore(userId);
  }

  setUserInFirestore(RegisterRequest registerRequest) async {
    FirestoreHelper.firestoreHelper.saveUserInFirestore(registerRequest);
  }
}
