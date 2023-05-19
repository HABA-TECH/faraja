import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haba/screens/auth/forgot_password.dart';
import 'package:haba/screens/auth/login.dart';
import 'package:haba/screens/auth/personal_information.dart';
import 'package:haba/screens/auth/register.dart';
import 'package:haba/screens/auth/welcome_back.dart';
import 'package:haba/screens/my_home_page.dart';
import 'package:haba/screens/onboarding/onboarding_main.dart';
import 'package:logger/logger.dart';

import '../screens/auth/otp_page.dart';

class AppRouter {
  static const String splashScreenRoute = "/onboarding";
  static const String homeRoute = "/home";
  static const String register = "/register";
  static const String personalInformation = "/personalInformation";
  static const String otp = "/otp";
  static const String login = "/login";
  static const String welcomeBack = "/welcomeBack";
  static const String forgotPassword = "/forgotPassword";

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

      case personalInformation:
        return _route(
          const PersonalInformation(),
          personalInformation,
        );

      case otp:
        return _route(
          const OtpPage(),
          otp,
        );
      case login:
        return _route(
          const Login(),
          login,
        );
      case welcomeBack:
        return _route(
          const WelcomeBack(),
          welcomeBack,
        );
      case forgotPassword:
        return _route(
          const ForgotPassword(),
          forgotPassword,
        );

      default:
        return _route(
          Scaffold(
            appBar: AppBar(
              title: const Text('Haba'),
            ),
            body: const Center(
              child: Text('Unknown page'),
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
