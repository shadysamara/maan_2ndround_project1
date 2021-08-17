import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/data/auth_helper.dart';
import 'package:maan1/ui/auth/data/firestore_helper.dart';
import 'package:maan1/ui/auth/models/register_request.dart';
import 'package:maan1/ui/auth/providers/auth_provider.dart';
import 'package:maan1/ui/auth/ui/widgets/custom_dropdown_button.dart';
import 'package:maan1/ui/auth/ui/widgets/custom_textfield.dart';
import 'package:maan1/ui/chat/data/data_firestore_helper.dart';
import 'package:maan1/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Form(
        key: provider.loginKey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextfeild(
                  label: 'Email',
                  controller: provider.emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                CustomTextfeild(
                  label: 'Password',
                  controller: provider.passwordController,
                  isHidden: true,
                ),
                CustomButton(title: 'Login', function: provider.loginUser),
                CustomButton(
                    title: 'Send Verification Code Again',
                    function: provider.verifyEmail)
              ],
            ),
          ),
        ),
      );
    });
  }
}
