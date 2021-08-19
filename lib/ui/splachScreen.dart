import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/providers/auth_provider.dart';
import 'package:maan1/ui/auth/ui/auth_main_page.dart';
import 'package:maan1/ui/chat/ui/home_page.dart';
import 'package:maan1/ui/helpers/route_helper.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatelessWidget {
  static final routeName = 'splachScreen';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) {
      bool userExisting =
          Provider.of<AuthProvider>(context, listen: false).checkUser();
      if (userExisting) {
        RouteHelper.routeHelper.goAndReplacePage(HomePage.routeName);
      } else {
        RouteHelper.routeHelper.goAndReplacePage(AuthMainPage.routeName);
      }
    });
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 30,
        ),
      ),
    );
  }
}
