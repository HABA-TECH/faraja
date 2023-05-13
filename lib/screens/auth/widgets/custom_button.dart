import 'package:flutter/material.dart';
import 'package:haba/utils/TextStyles.dart';
import 'package:haba/utils/colors.dart';

class CustomButton extends StatelessWidget {
  void Function()? onPressed;
  final String buttonText;
  final double height;
  final double width;
  final double radius;
  CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.width,
    this.height = 50,
    this.radius = 5,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle textButtonStyle = TextButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
      minimumSize: Size(width, height),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );

    return Center(
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: TextButton(
            onPressed: onPressed,
            style: textButtonStyle,
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyles.normal(30).copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
