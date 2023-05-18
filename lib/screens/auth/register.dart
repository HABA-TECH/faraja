import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haba/utils/widgets/custom_textfield.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/colors.dart';
import 'package:haba/utils/widgets/translucentBG.dart';

import '../../utils/TextStyles.dart';
import '../../utils/widgets/custom_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                      child: Text("REGISTER", style: TextStyles.light(20)),
                    ),
                  ),
                  CustomTextField(
                    hintText: "eg john@mail.com",
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    obscureText: false,
                  )
                ],
              ))),
    );



    //  Stack(
    //   children: [
    //     Positioned.fill(
    // child: Container(
    //   // color: Colors.blueGrey,
    //   decoration: const BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage('assets/backgroundimage.png')
    //     )
    //   ),
    // ),
    //     ),
    //     Positioned(
    //       bottom: 0,
    //       left: 0,
    //       right: 0,
    // child: Container(
    //   height: MediaQuery.of(context).size.height * 0.59,
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   decoration: BoxDecoration(
    //     color: Colors.white.withOpacity(0.5),
    //     borderRadius: const BorderRadius.only(
    //       topLeft: Radius.circular(10),
    //       topRight: Radius.circular(10),
    //     ),
    //   ),
    //         child: SingleChildScrollView(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               const SizedBox(height: 20),
    //               Text(
    //                 "REGISTER",
    //                 style: TextStyles.normal(23),
    //               ),
    //               const SizedBox(height: 10),
    //               Padding(
    //                 padding: const EdgeInsets.all(10),
    //                 child: Column(
    //                   children: [
    //                     Align(
    //                       alignment: Alignment.centerLeft,
    //                       child: Text(
    //                         "Email",
    //                         style: TextStyles.normal(18),
    //                       ),
    //                     ),
    //                     const SizedBox(height: 5),
    //                     CustomTextField(
    //                       hintText: "eg john@mail.com",
    //                       controller: emailController,
    //                       inputType: TextInputType.emailAddress,
    //                       obscureText: false,
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               const SizedBox(height: 3),
    //               Padding(
    //                 padding: const EdgeInsets.all(10),
    //                 child: Column(
    //                   children: [
    //                     Align(
    //                       alignment: Alignment.centerLeft,
    //                       child: Text(
    //                         "Password",
    //                         style: TextStyles.normal(18),
    //                       ),
    //                     ),
    //                     const SizedBox(height: 5),
    //                     CustomTextField(
    //                       hintText: "Password",
    //                       controller: passwordController,
    //                       obscureText: true,
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               Align(
    //                 alignment: Alignment.centerLeft,
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(left: 10),
    //                   child: Text(
    //                     "It must contain not less than 8 characters",
    //                     style: TextStyles.normal().copyWith(
    //                       color: AppTheme.hintTextColor,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(height: 10),
    //               Align(
    //                 alignment: Alignment.centerLeft,
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(left: 10),
    //                   child: RichText(
    //                     text: TextSpan(
    //                       text: 'Already have an account? ',
    //                       style: TextStyles.normal(15).copyWith(
    //                         color: const Color(0xFF211212),
    //                       ),
    //                       children: [
    //                         TextSpan(
    //                           text: 'login',
    //                           style: TextStyles.normal(15).copyWith(
    //                             color: AppTheme.primaryColor,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(height: 20),
    //               CustomButton(
    //                 onPressed: () {},
    //                 buttonText: "Register",
    //                 radius: 25,
    //                 width: MediaQuery.of(context).size.width,
    //                 height: 50,
    //               ),
    //               const SizedBox(height: 10),
    //               const Text("Or Sign Up with"),
    //               //TODO: socials login icons
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
    // );
  }
}
