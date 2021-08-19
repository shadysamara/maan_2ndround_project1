import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maan1/ui/auth/data/auth_helper.dart';
import 'package:maan1/ui/auth/data/firestorage_helper.dart';
import 'package:maan1/ui/auth/data/firestore_helper.dart';
import 'package:maan1/ui/auth/models/register_request.dart';
import 'package:maan1/ui/auth/models/user_models.dart';
import 'package:maan1/ui/auth/ui/auth_main_page.dart';
import 'package:maan1/ui/auth/ui/register_page.dart';
import 'package:maan1/ui/chat/ui/edit_profile.dart';
import 'package:maan1/ui/chat/ui/home_page.dart';
import 'package:maan1/ui/helpers/route_helper.dart';
import 'package:ringtone_player/ringtone_player.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    if (checkUser()) {
      getUserFormFirestore(AuthHelper.authHelper.getUserId());
    }
  }
  UserModel userModel;
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
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextStyle headingStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: 25);
  TextStyle bodyStyle = TextStyle(fontSize: 20, color: Colors.blue);
  registerNewUser() async {
    // RingtonePlayer.play(
    //   alarmMeta: AlarmMeta(
    //     'dev.cruv.ringtone_player_example.MainActivity',
    //     'ic_alarm_notification',
    //     contentTitle: 'Alarm',
    //     contentText: 'Alarm is active',
    //     subText: 'Subtext',
    //   ),
    //   android: Android.ringtone,
    //   ios: Ios.electronic,
    //   loop: true, // Android only - API >= 28
    //   volume: 1.0, // Android only - API >= 28
    //   alarm: true, // Android only - all APIs
    // );
    // FlutterRingtonePlayer.stop();
    // FlutterRingtonePlayer.play(
    //   android: AndroidSounds.ringtone,
    //   ios: IosSounds.glass,
    //   looping: true, // Android only - API >= 28
    //   volume: 0.1, // Android only - API >= 28
    //   asAlarm: false, // Android only - all APIs
    // );
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
      registerRequest.id = userCredential.user.uid;
      setUserInFirestore(registerRequest);
      await verifyEmail();

      RouteHelper.routeHelper
          .showCustomDialoug('please chech your email to verify your account');
    }
  }

  loginUser() async {
    UserCredential userCredential = await login();
    // if (userCredential.user.emailVerified) {
    if (true) {
      getUserFormFirestore(userCredential.user.uid);
      RouteHelper.routeHelper.goAndReplacePage(HomePage.routeName);
    } else {
      verifyEmail();
      RouteHelper.routeHelper.showCustomDialoug(
          'sorry, you cant login because your email is not verified');
    }
  }

  File file;
  setFile(File file) {
    this.file = file;
    notifyListeners();
  }

  updateUserImage() async {
    XFile file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file.path);

    // upload image to firestorage
    String imageUrl =
        await FireStorageHelper.fireStorageHelper.uploadImage(this.file);
    userModel.imageUrl = imageUrl;
    // update image in firestore
    updateUser();
  }

  Future<UserCredential> signup(RegisterRequest registerRequest) async {
    UserCredential userCredential =
        await AuthHelper.authHelper.signup(registerRequest);
    return userCredential;
  }

  Future<UserCredential> login() async {
    UserCredential userCredential = await AuthHelper.authHelper
        .login(emailController.text, passwordController.text);
    return userCredential;
  }

  resetPassword(String email) async {
    AuthHelper.authHelper.resetPassword(email);
  }

  verifyEmail() async {
    await AuthHelper.authHelper.verifyEmail();
    logout();
  }

  logout() async {
    await AuthHelper.authHelper.logout();
    RouteHelper.routeHelper.goAndReplacePage(AuthMainPage.routeName);
  }

  checkUser() {
    return AuthHelper.authHelper.checkUser();
  }

  getUserFormFirestore(String userId) async {
    this.userModel =
        await FirestoreHelper.firestoreHelper.getUserFromFirestore(userId);
    notifyListeners();
  }

  setUserInFirestore(RegisterRequest registerRequest) async {
    print(registerRequest.toMap());
    FirestoreHelper.firestoreHelper.saveUserInFirestore(registerRequest);
  }

  /// fill the textfields in the edit profile page with the usermodel values
  /// then go to edit profile page
  editProfileNavigation() {
    userNameController.text = userModel.userName;
    countryController.text = userModel.country;
    cityController.text = userModel.city;
    phoneController.text = userModel.phoneNumber;
    selectedGender = userModel.gender;
    RouteHelper.routeHelper.goToPage(EditProfile.routeName);
  }

  /// take the new values on the textfields and change the local usermodel
  /// then update the user in the firestore based on the new values
  /// go back to home page
  editProfile() async {
    userModel.userName = userNameController.text;
    userModel.gender = selectedGender;
    userModel.country = countryController.text;
    userModel.city = cityController.text;
    userModel.phoneNumber = phoneController.text;

    await updateUser();
    RouteHelper.routeHelper.goBack();
  }

  updateUser() async {
    await FirestoreHelper.firestoreHelper.updateUserFromFirestore(userModel);
    getUserFormFirestore(userModel.id);
  }
}
