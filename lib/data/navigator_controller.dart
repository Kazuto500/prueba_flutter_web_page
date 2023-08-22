import 'package:flutter/material.dart';

class NavigatorController with ChangeNotifier {
  String currentRoute = "Boxes";

  navigateToRoute({required String route}) {
    currentRoute = route;
    notifyListeners();
  }
}
