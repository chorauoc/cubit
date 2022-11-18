import 'package:flutter/material.dart';

import '../ui/home/view/home_screen.dart';

abstract class Routes {
  static const INITIAL = '/';
}

class RouteGenerator {
  static final RouteGenerator _generator = RouteGenerator._init();
  static RouteGenerator get router => _generator;
  RouteGenerator._init();

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case Routes.INITIAL:
        return navigate(HomeScreen());
    }
    return null;
  }

  navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
