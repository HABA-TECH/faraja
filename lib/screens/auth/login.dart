import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haba/routes/appRouter.dart';
import 'package:haba/utils/widgets/custom_textfield.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/colors.dart';
import 'package:haba/utils/widgets/translucentBG.dart';

import '../../utils/TextStyles.dart';
import '../../utils/widgets/custom_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                  ))),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: TranslucentContainer(
                list: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text("LOGIN", style: TextStyles.h2(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: CustomTextField(
                      text: 'Email',
                      hintText: "eg john@mail.com",
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomTextField(
                      hintText: "Password",
                      text: 'Password',
                      controller: passwordController,
                      inputType: TextInputType.visiblePassword,
                      obscureText: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 55.0),
                    child: CustomButton(
                      buttonText: 'Login',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRouter.dash);
                      },
                      width: MediaQuery.of(context).size.width * .9,
                      height: 50,
                      radius: 20,
                    ),
                  )
                ],
              ))),
    );
  }
}
