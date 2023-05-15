import 'package:flutter/material.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final bool obscureText;
  final int maxLines;

  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
  });

  final InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
      color: AppColors.primaryColor,
      width: 1.2,
      strokeAlign: BorderSide.strokeAlignCenter,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: controller,
      style: TextStyles.normal(20),
      keyboardType: inputType,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        hintText: hintText,
        hintStyle: TextStyles.light(15).copyWith(color: AppTheme.hintTextColor),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      ),
    );
  }
}
