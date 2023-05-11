import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: IntroductionScreen(
          globalFooter: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  minimumSize: const Size(250, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 22,
                ),
              )
            ],
          ),
          curve: Curves.bounceInOut,
          safeAreaList: const [true, true, true, true],
          rawPages: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Lottie.asset('assets/lottie/saving-money.json'),
                    ),
                    Container(
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: SvgPicture.asset(
                            'assets/icons/sparkle.svg',
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 400,
                        color: Colors.lightBlue,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 18.0),
                                    child: Text(
                                      'Little by',
                                      style: TextStyles.normal(54),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Text(
                                  'Little fills',
                                  style: TextStyles.normal(54),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Text(
                                  'the pot',
                                  style: TextStyles.normal(54),
                                ),
                              ),
                            ),
                            // Align(
                            //   alignment: Alignment.centerLeft,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(top:50.0),
                            //     child: Text(
                            //       "Haba allows you to allocate",
                            //       style: TextStyles.normal(20),
                            //       softWrap: true,
                            //       maxLines: 3,
                            //     ),
                            //   ),
                            // ),
                                
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Lottie.asset('assets/lottie/tracker.json'),
                    ),
                    Text(
                      "Track your",
                      style: TextStyles.h1(),
                    ),
                    Text(
                      "Expenses",
                      style: TextStyles.h1(),
                    ),
                    Text(
                      'Haba analytics allows you to see how much you spend on every expense in detail',
                      style: TextStyles.normal(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: AppTheme.primaryDark,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/circles.svg',
                  ),
                  Center(
                    child: Text(
                      "Third Screen",
                      style: TextStyles.h2(),
                    ),
                  ),
                ],
              ),
            ),
          ],
          showDoneButton: false,
          showNextButton: false,
          showSkipButton: false,
          dotsDecorator: DotsDecorator(
            size: const Size(30.0, 5),
            activeSize: const Size(30.0, 5),
            activeColor: AppTheme.primaryColor,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
          controlsPosition: const Position(left: 0, right: 0, bottom: 30),
          dotsFlex: 2,
          onChange: (value) => print("changed $value"),
        ),
      ),
    );
  }
}
