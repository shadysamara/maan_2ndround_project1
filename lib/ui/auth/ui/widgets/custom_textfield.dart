import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class CustomTextfeild extends StatelessWidget {
  String label;

  TextEditingController controller;

  bool isHidden;
  TextInputType textInputType;
  CustomTextfeild(
      {this.label,
      this.controller,
      this.textInputType = TextInputType.text,
      this.isHidden = false});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        obscureText: isHidden,
        keyboardType: textInputType,
        controller: this.controller,
        validator: (v) =>
            Provider.of<AuthProvider>(context, listen: false).nullValidate(v),
        decoration: InputDecoration(
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
