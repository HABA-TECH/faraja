import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/widgets/custom_button.dart';
import 'package:haba/utils/widgets/translucentBG.dart';
import 'package:logger/logger.dart';

import '../../utils/TextStyles.dart';
import '../../utils/widgets/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: TranslucentContainer(
            list: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text("LOG IN", style: TextStyles.light(20)),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsetsDirectional.only(bottom: 3),
                              child: Text("Email"),
                            ),
                            CustomTextField(
                              hintText: "eg example@mail.com",
                              controller: emailController,
                              inputType: TextInputType.emailAddress,
                              obscureText: false,
                            ),
                          ],
                        ),
                      ),
                      //PASSWORD
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsetsDirectional.only(bottom: 3),
                              child: Text("Password"),
                            ),
                            Row(
                              children: [
                                //input field
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: CustomTextField(
                                    hintText: "Password",
                                    controller: emailController,
                                    inputType: TextInputType.emailAddress,
                                    obscureText: false,
                                  ),
                                ),
                                //fingerprint icon
                                Expanded(
                                  child: Container(
                                    color: Colors.red,
                                    child: SvgPicture.asset(
                                      'assets/icons/fingerprint.svg',
                                      height: 50,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyles.normal(15).copyWith(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/welcomeBack');
                    Logger logger = Logger();
                    logger.i("To Welcome Back Page");
                  },
                  buttonText: "Login",
                  width: MediaQuery.of(context).size.width,
                  radius: 29,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Or Login with",
                        style: TextStyles.normal(18),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            color: Colors.blue,
                            child: SvgPicture.asset(
                              'assets/icons/hide.svg',
                              height: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            color: Colors.blue,
                            child: SvgPicture.asset(
                              'assets/icons/hide.svg',
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
