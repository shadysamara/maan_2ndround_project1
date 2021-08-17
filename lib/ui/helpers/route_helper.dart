import 'package:flutter/material.dart';

class RouteHelper {
  RouteHelper._();
  static RouteHelper routeHelper = RouteHelper._();
  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  goToPage(String routeName) {
    navigationKey.currentState.pushNamed(routeName);
  }

  goAndReplacePage(String routeName) {
    navigationKey.currentState.pushReplacementNamed(routeName);
  }

  goBack() {
    navigationKey.currentState.pop();
  }

  showCustomDialoug(String contente) {
    showDialog(
        context: navigationKey.currentContext,
        builder: (context) {
          return AlertDialog(
            content: Text(contente),
            actions: [
              RaisedButton(
                child: Text('ok'),
                onPressed: () {
                  goBack();
                },
              )
            ],
          );
        });
  }
}
