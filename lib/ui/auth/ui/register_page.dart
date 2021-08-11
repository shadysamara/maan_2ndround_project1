import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/data/auth_helper.dart';
import 'package:maan1/ui/auth/models/register_request.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(child: RaisedButton(
        onPressed: () {
          // AuthHelper.authHelper.logout();
          AuthHelper.authHelper.login('shady.samara@gmail.com', 'asdfghjkl');
          // print(FirebaseAuth.instance.currentUser.emailVerified);
        },
      )),
    );
  }
}
