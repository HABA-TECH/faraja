import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/widgets/custom_button.dart';

class WelcomeBack extends StatefulWidget {
  const WelcomeBack({super.key});

  @override
  State<WelcomeBack> createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/backgroundimage.png',
            ),
          ),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                AppTheme.secondaryColor.withOpacity(0.9),
                AppTheme.secondaryColor.withOpacity(0),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset("assets/icons/logo.svg"),
              Text(
                "Welcome Back!",
                style: TextStyles.light(30).copyWith(
                  color: AppTheme.primaryColor,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgotPassword');
                    },
                    buttonText: "Login as Clinton",
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    radius: 29,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
