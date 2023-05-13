import 'package:flutter/material.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isPassword;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: AppColors.primaryColor),
  );
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      maxLines: widget.maxLines,
      controller: widget.controller,
      style: TextStyles.normal(20),
      keyboardType: widget.inputType,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        hintText: widget.hintText,
        hintStyle: TextStyles.light(16),
        filled: true,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).hintColor.withOpacity(0.3)),
                onPressed: _toggle,
              )
            : null,
      ),
    );
  }
}
