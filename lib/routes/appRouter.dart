import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haba/screens/my_home_page.dart';
import 'package:haba/screens/onboarding/onboarding_main.dart';
import 'package:logger/logger.dart';

class AppRouter {
  static const String splashScreenRoute = "/onboarding";
  static const String homeRoute = "/home";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _args = settings.arguments;

    Logger _logger = Logger();
    _logger.wtf("Route Name:\n${settings.name}");
    switch (settings.name) {
      case splashScreenRoute:
        return _route(
          OnboardingOverview(),
          splashScreenRoute,
        );
        break;
      case homeRoute:
        return _route(
          const MyHomePage(),
          homeRoute,
        );
        break;

      default:
        return _route(
          Scaffold(
            appBar: AppBar(
              title: Text('Haba'),
            ),
            body: Center(
              child: Text('Unknown page'),
            ),
          ),
          "unknown",
        );
        break;
    }
  }

  static _route(Widget page, String route) {
    return CupertinoPageRoute(
      title: route,
      builder: (context) {
        return page;
      },
    );
  }
}
