import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigationKey;
  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  goTO(BuildContext ctx, Widget screen) {
    return navigationKey.currentState!
        .push(MaterialPageRoute(builder: (ctx) => screen));
  }

  goToAndReplace(BuildContext ctx, Widget screen) {
    return navigationKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (ctx) => screen));
  }

  goBack(){
    return navigationKey.currentState!.pop();
  }

}
