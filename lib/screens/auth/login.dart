import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haba/routes/appRouter.dart';
import 'package:haba/utils/widgets/custom_textfield.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/colors.dart';
import 'package:haba/utils/widgets/translucentBG.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/TextStyles.dart';
import '../../utils/widgets/custom_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
// ----------------------------------------------------------------
  late String phoneNum = '';
  late String email = '';
  late String lastName = '';
  late String password = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void setSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('session', true);
    // prefs.setString('password', password);
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNum = prefs.getString('phone') ?? '0711';
      password = prefs.getString('pass') ?? '';
      // password = prefs.getString('password') ?? 'test@gmail.com';

      // prefs.setString('lastName', lastName);
      // prefs.setString('email', email);
      // prefs.setString('phone', phone);
    });
  }

  // =================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Material(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/backgroundimage.png',
                              ))),
                    ),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: TranslucentContainer(
                              list: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child:
                                        Text("LOGIN", style: TextStyles.h2(20)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 80),
                                  child: CustomTextField(
                                    text: 'Phone Number',
                                    hintText: "eg 0712...",
                                    controller: phoneController,
                                    inputType: TextInputType.phone,
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
                                      // ignore: avoid_print
                                      print(
                                          'PHONE NUMBER TYPED ${phoneController.text}');
                                      // ignore: avoid_print
                                      print('PHONE NUMBER SAVED ${phoneNum}');
                                      if (phoneController.text == phoneNum &&
                                          passwordController.text == password) {
                                        // ignore: avoid_print
                                        setSession();
                                        print('SUCCESS');
                                        Navigator.pushReplacementNamed(
                                            context, AppRouter.dash);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: const Text(
                                              'Wrong email or password'),
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              // Some code to undo the change.
                                            },
                                          ),
                                        ));
                                      }
                                    },
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    height: 50,
                                    radius: 20,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Forgot credentials?  ",
                                          style: TextStyles.h1(
                                              12, Colors.grey[800]),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, AppRouter.register);
                                          },
                                          child: Text(
                                            "Reset Password",
                                            style: TextStyles.h1(
                                                12, AppColors.primaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
