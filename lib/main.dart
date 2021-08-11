import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/data/auth_helper.dart';
import 'package:maan1/ui/auth/models/register_request.dart';
import 'package:maan1/ui/auth/ui/register_page.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RegisterPage();
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Error')),
            );
          } else {
            return Scaffold(
              body: Center(child: Text('Loading')),
            );
          }
        });
  }
}
