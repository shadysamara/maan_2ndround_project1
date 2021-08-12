import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/data/auth_helper.dart';
import 'package:maan1/ui/auth/data/firestore_helper.dart';
import 'package:maan1/ui/auth/models/register_request.dart';
import 'package:maan1/ui/auth/ui/widgets/custom_dropdown_button.dart';
import 'package:maan1/ui/auth/ui/widgets/custom_textfield.dart';
import 'package:maan1/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;

  String password;

  saveEmail(v) => this.email = v;

  savePassword(v) => this.password = v;

  nullValidate(String v) {
    if (v == null || v.length == 0) {
      return 'Required Field';
    }
  }

  login() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      AuthHelper.authHelper.login(email, password, context);
    }
  }

  verifyEmail() {
    AuthHelper.authHelper.verifyEmail(email);
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Container(
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
              CustomButton(title: 'Login', function: login),
              CustomButton(
                  title: 'Send Verification Code Again', function: verifyEmail)
            ],
          ),
        ),
      ),
    );
  }
}
