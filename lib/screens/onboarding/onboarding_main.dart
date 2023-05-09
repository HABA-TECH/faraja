import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haba/utils/AppTheme.dart';
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
                    const Text(
                      "Little by",
                      style: TextStyle(fontSize: 50),
                    ),
                    const Text(
                      "Little fills",
                      style: TextStyle(fontSize: 50),
                    ),
                    const Text(
                      "the pot",
                      style: TextStyle(fontSize: 50),
                    ),
                    const Text(
                      "Swahili riddle",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      '"Haba na haba hujaza kibaba"',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      "Haba allows you to alocate small income towards your savings,investments and other expenses without a hassle",
                      style: TextStyle(fontSize: 20),
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
                    const Text(
                      "Track your",
                      style: TextStyle(fontSize: 50),
                    ),
                    const Text(
                      "Expenses",
                      style: TextStyle(fontSize: 50),
                    ),
                    const Text(
                      'Haba analytics allows you to see how much you spend on every expense in detail',
                      style: TextStyle(fontSize: 20),
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
                  const Center(
                    child: Text(
                      "Third Screen",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
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
