import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haba/screens/auth/login.dart';
import 'package:haba/screens/auth/otp_screen.dart';
import 'package:haba/screens/auth/personal_info.dart';
import 'package:haba/screens/auth/register.dart';
import 'package:haba/screens/dash.dart';
import 'package:haba/screens/homepages/admin_home.dart';
import 'package:haba/screens/loans/verifyPay.dart';
import 'package:haba/screens/onboarding/onboarding_main.dart';
import 'package:logger/logger.dart';

import '../screens/loans/loanapplication.dart';
import '../screens/loans/loanoffers.dart';
import '../screens/personalInfo/personalInformation.dart';

class AppRouter {
  static const String splashScreenRoute = "/onboarding";
  static const String dash = "/home";
  static const String adminHome = "/adminHome";
  static const String register = "/register";
  static const String login = "/login";
  static const String personal_Info = "/personal_Info";
  static const String apply = "/apply";
  static const String otpField = "/otpField";
  static const String personalInfoHome = "/personalInfoHome";
  static const String loanOffers = "/loanOffers";
  static const String verify = "/verify";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    Logger _logger = Logger();
    _logger.wtf("Route Name:\n${settings.name}");
    switch (settings.name) {
      case splashScreenRoute:
        return _route(
          const OnboardingOverview(),
          splashScreenRoute,
        );

      case dash:
        return _route(
          Dashboard(),
          dash,
        );
      case adminHome:
        return _route(
          const AdminHome(),
          adminHome,
        );
      case personal_Info:
        return _route(
          const PersonalInfo(),
          personal_Info,
        );
      case personalInfoHome:
        return _route(
          const PersonalInfoHome(),
          personalInfoHome,
        );

      case loanOffers:
        return _route(
          const LoanOffers(),
          loanOffers,
        );
      case apply:
        final interest = args as double;
        return _route(
          LoaApplication(interest: interest),
          apply,
        );

      case otpField:
        return _route(
          const OTPScreen(),
          otpField,
        );
      case login:
        return _route(
          const Login(),
          login,
        );

      case register:
        return _route(
          const Register(),
          register,
        );

      case verify:
        return _route(
          const VerifyPay(),
          verify,
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
