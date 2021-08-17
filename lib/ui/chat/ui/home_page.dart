import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final routeName = 'homePage';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaisedButton(
              child: Text('change variable value'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Change ui'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
