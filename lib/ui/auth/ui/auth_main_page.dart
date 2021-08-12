import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/ui/login_page.dart';
import 'package:maan1/ui/auth/ui/register_page.dart';

class AuthMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Chat Auth'),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'SIGNUP',
                ),
                Tab(
                  text: 'SIGNIN',
                )
              ],
            ),
          ),
          body: TabBarView(children: [RegisterPage(), LoginPage()]),
        ));
  }
}
