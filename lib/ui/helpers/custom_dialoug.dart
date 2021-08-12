import 'package:flutter/material.dart';

class CustomDialoug {
  CustomDialoug._();
  static CustomDialoug customDialoug = CustomDialoug._();
  showCustomDialoug(context, String title, String content) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(content),
            title: Text(title),
          );
        });
  }
}
