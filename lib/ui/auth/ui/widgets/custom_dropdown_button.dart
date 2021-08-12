import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/models/register_request.dart';

class CustomDropDownButton extends StatefulWidget {
  Function saveFun;
  CustomDropDownButton({this.saveFun});
  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  // Set<String> genders = {'male', 'female'};
  Gender value = Gender.male;
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
          value: this.value,
          onChanged: (e) {
            this.value = e;
            widget.saveFun(e);
            setState(() {});
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
