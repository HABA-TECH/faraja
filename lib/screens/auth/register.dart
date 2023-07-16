import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haba/routes/appRouter.dart';
import 'package:haba/utils/widgets/custom_textfield.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/colors.dart';
import 'package:haba/utils/widgets/translucentBG.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/data/sharedPreferences.dart';
import '../../utils/TextStyles.dart';
import '../../utils/widgets/custom_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void setData(phone, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('phone', phone);
    prefs.setString('pass', password);
    // prefs.setString('password', password);
  }

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
                                  child: Text("REGISTER",
                                      style: TextStyles.h2(20)),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "It must contain not less than 8 characters",
                                    style: TextStyles.h1(12, Colors.grey[800]),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Already have an account?  ",
                                        style:
                                            TextStyles.h1(12, Colors.grey[800]),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, AppRouter.login);
                                        },
                                        child: Text(
                                          "Login",
                                          style: TextStyles.h1(
                                              12, AppColors.primaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: CustomButton(
                                  buttonText: 'Register',
                                  onPressed: () {
                                    try {
                                      // print(_fetchData());
                                      setData(phoneController.text,
                                          passwordController.text);
                                      Navigator.pushNamed(
                                          context, AppRouter.personal_Info);
                                      print(
                                          'SAVED CREDS ${phoneController.text}');
                                      print(
                                          'PASS CREDS ${passwordController.text}');
                                    } catch (e) {
                                      print('Error adding data: $e');
                                    }
                                  },
                                  width: MediaQuery.of(context).size.width * .9,
                                  height: 50,
                                  radius: 20,
                                ),
                              )
                            ],
                          ),
                        ),
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
