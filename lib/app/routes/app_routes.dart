import 'package:flutter/material.dart';
import 'package:locfet/home/view/home_page.dart';

class AppRoutes {
  Route<dynamic> onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
