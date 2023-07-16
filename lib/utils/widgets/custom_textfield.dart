import 'package:flutter/material.dart';
import 'package:haba/utils/AppTheme.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? color;
  final String text;
  final TextInputType inputType;
  final bool obscureText;
  final int maxLines;

  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.color,
    required this.text,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
  });

  final InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
      color: AppColors.greyPAGEBLUE!,
      width: 1.2,
      strokeAlign: BorderSide.strokeAlignCenter,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: Text(text)),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines: 2,
          controller: controller,
          style: TextStyles.normal(22),
          keyboardType: inputType,
          cursorColor: Theme.of(context).primaryColor,
          obscureText: obscureText,
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: InputDecoration(
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            hintText: hintText,
            hintStyle:
                TextStyles.normal(15).copyWith(color: Colors.grey, height: 2),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          ),
        ),
      ],
    );
  }
}
