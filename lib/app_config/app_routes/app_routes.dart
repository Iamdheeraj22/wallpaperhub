import 'package:flutter/material.dart';
import 'package:wallpaperhub/Pages/HomePage.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        MaterialPageRoute(builder: (context) => const HomePage());
    }
    return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
