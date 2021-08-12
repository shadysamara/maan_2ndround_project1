import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/data/auth_helper.dart';
import 'package:maan1/ui/auth/data/firestore_helper.dart';
import 'package:maan1/ui/auth/models/register_request.dart';
import 'package:maan1/ui/auth/ui/widgets/custom_dropdown_button.dart';
import 'package:maan1/ui/auth/ui/widgets/custom_textfield.dart';
import 'package:maan1/widgets/custom_button.dart';

class RegisterPage extends StatelessWidget {
  String email;
  String password;
  String userName;
  Gender gender;
  String phoneNumber;
  String city;
  String country;
  saveEmail(v) => this.email = v;
  savePassword(v) => this.password = v;
  saveUserName(v) => this.userName = v;
  saveGender(v) => this.gender = v;
  savePhone(v) => this.phoneNumber = v;
  saveCountry(v) => this.country = v;
  saveCity(v) => this.city = v;

  nullValidate(String v) {
    if (v == null || v.length == 0) {
      return 'Required Field';
    }
  }

  registerUser() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      RegisterRequest registerRequest = RegisterRequest(
          email: email,
          password: password,
          userName: userName,
          gender: gender,
          phoneNumber: phoneNumber,
          city: city,
          country: country);
      AuthHelper.authHelper.signup(registerRequest);
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfeild(
              label: 'Email',
              save: saveEmail,
              textInputType: TextInputType.emailAddress,
              validate: nullValidate,
            ),
            CustomTextfeild(
              label: 'Password',
              isHidden: true,
              save: savePassword,
              validate: nullValidate,
            ),
            CustomTextfeild(
              label: 'UserName',
              save: saveUserName,
              validate: nullValidate,
            ),
            CustomDropDownButton(
              saveFun: saveGender,
            ),
            CustomTextfeild(
              label: 'Country',
              save: saveCountry,
              validate: nullValidate,
            ),
            CustomTextfeild(
              label: 'City',
              save: saveCity,
              validate: nullValidate,
            ),
            CustomTextfeild(
              label: 'Phone',
              save: savePhone,
              validate: nullValidate,
            ),
            CustomButton(title: 'Register', function: registerUser)
          ],
        ),
      ),
    );
  }
}
