import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:haba/routes/approuter.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

class OnboardingOverview extends StatelessWidget {
  const OnboardingOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    return CupertinoOnboarding(
      onPressedOnLastPage: () {
        Navigator.popAndPushNamed(context, AppRouter.homeRoute);
        logger.i('To Register screen');
      },
      bottomButtonColor: AppTheme.primaryColor,
      pages: [
        // little by little
        Align(
          child: WhatsNewPage(
            title: Text(
              "Little by Little \nfills the pot",
              textAlign: TextAlign.center,
              style: TextStyles.h2(35),
            ),
            features: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                // color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30)
                      .copyWith(top: 10),
                  child: Lottie.asset(
                    'assets/lottie/saving-money.json',
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),
              ),
              const WhatsNewFeature(
                title: Text('Swahili Riddle'),
                description: Text(
                  'Haba na haba hujaza kibaba',
                ),
                icon:
                    Icon(CupertinoIcons.sparkles, color: AppTheme.primaryColor),
              ),
              const WhatsNewFeature(
                title: Text(
                  "Haba allows you to allocate small income towards your savings,investment and other expenses without a hassle",
                ),
                description: Text(''),
                icon: Icon(
                  CupertinoIcons.paintbrush,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),

        // Tracker
        Align(
          child: WhatsNewPage(
            title: Text(
              "Track your Expenses",
              textAlign: TextAlign.center,
              style: TextStyles.h2(35),
            ),
            features: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                // color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30)
                      .copyWith(top: 10),
                  child: Lottie.asset(
                    'assets/lottie/tracker.json',
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),
              ),
              const WhatsNewFeature(
                title: Text('Manage every penny'),
                description: Text(
                  ' ',
                ),
                icon:
                    Icon(CupertinoIcons.sparkles, color: AppTheme.primaryColor),
              ),
              const WhatsNewFeature(
                title: Text(
                  "With Haba analytics, you can view how much you spend on every expense in detail",
                ),
                description: Text(''),
                icon: Icon(
                  CupertinoIcons.paintbrush,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),

        // Automate
        Align(
          child: WhatsNewPage(
            title: Text(
              "Automate your\nPayments",
              textAlign: TextAlign.center,
              style: TextStyles.h2(35),
            ),
            features: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                // color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30)
                      .copyWith(top: 10),
                  child: Lottie.asset(
                    'assets/lottie/automate.json',
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),
              ),
              const WhatsNewFeature(
                title: Text(
                  "Integrate once, Forget about it. ",
                ),
                description: const Text(
                  ' ',
                ),
                icon:
                    Icon(CupertinoIcons.sparkles, color: AppTheme.primaryColor),
              ),
              const WhatsNewFeature(
                title: Text(
                    "Haba allows you to auto-pay  your expenses while you focus on important things."),
                description: Text(''),
                icon: Icon(
                  CupertinoIcons.paintbrush,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
