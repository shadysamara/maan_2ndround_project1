import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function function;
  CustomButton({
    @required this.title,
    @required this.function,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: RaisedButton(
        color: Colors.greenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Text(this.title),
        onPressed: () => function(),
      ),
    );
  }
}
