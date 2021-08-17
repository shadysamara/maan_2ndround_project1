import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/data/auth_helper.dart';
import 'package:maan1/ui/auth/models/register_request.dart';
import 'package:maan1/ui/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class CustomDropDownButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      child: DropdownButton<Gender>(
          isExpanded: true,
          underline: Container(),
          value: Provider.of<AuthProvider>(context).selectedGender,
          onChanged: (e) {
            Provider.of<AuthProvider>(context, listen: false).saveGender(e);
          },
          items: Gender.values.map((e) {
            return DropdownMenuItem<Gender>(
              value: e,
              child:
                  Container(child: Text(e == Gender.male ? 'Male' : 'Female')),
            );
          }).toList()),
    );
  }
}
