import 'package:bloc_structure/home/view/home_page.dart';
import 'package:flutter/material.dart';

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
