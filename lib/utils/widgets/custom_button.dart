import 'package:flutter/material.dart';
import 'package:haba/utils/TextStyles.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final double height;
  final double width;
  final double radius;
  final Widget? child;
  final Color ?color;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.width,
    this.color,
    this.child,
    this.height = 50,
    this.radius = 5,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: color ??Theme.of(context).primaryColor,
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
          child: ElevatedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: child?? Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyles.normal(20).copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
