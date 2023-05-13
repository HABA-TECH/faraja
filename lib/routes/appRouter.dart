import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haba/screens/auth/register.dart';
import 'package:haba/screens/my_home_page.dart';
import 'package:haba/screens/onboarding/onboarding_main.dart';
import 'package:logger/logger.dart';

class AppRouter {
  static const String splashScreenRoute = "/onboarding";
  static const String homeRoute = "/home";
  static const String register = "/register";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _args = settings.arguments;

    Logger _logger = Logger();
    _logger.wtf("Route Name:\n${settings.name}");
    switch (settings.name) {
      case splashScreenRoute:
        return _route(
         const OnboardingOverview(),
          splashScreenRoute,
        );
     
      case homeRoute:
        return _route(
          const MyHomePage(),
          homeRoute,
        );
        
          case register:
        return _route(
          const Register(),
          register,
        );
      
      default:
        return _route(
          Scaffold(
            appBar: AppBar(
              title: const Text('Haba'),
            ),
            body:const Center(
              child:  Text('Unknown page'),
            ),
          ),
          "unknown",
        );
     
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
