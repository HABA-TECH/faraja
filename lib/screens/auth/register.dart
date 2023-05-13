import 'package:flutter/material.dart';
import 'package:haba/screens/auth/widgets/custom_textfield.dart';
import 'package:haba/utils/colors.dart';

import '../../utils/TextStyles.dart';
import 'widgets/custom_button.dart';

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
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "REGISTER",
                style: TextStyles.normal(25),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyles.normal(20),
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hintText: "eg john@mail.com",
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyles.normal(20),
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hintText: "Password",
                      controller: passwordController,
                      isPassword: true,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "It must contain not less than 8 characters",
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {},
                buttonText: "Register",
                radius: 30,
                width: MediaQuery.of(context).size.width,
                height: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
