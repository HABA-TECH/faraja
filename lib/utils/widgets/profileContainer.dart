import 'package:flutter/material.dart';

import '../TextStyles.dart';
import 'custom_button.dart';

class ProfileContainer extends StatelessWidget {
  final double radius;
  final Widget? child;
  final double height;
  final String buttonText;
  final Icon icon;
  final void Function()? onPressed;
  final Color? color;
  const ProfileContainer({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.icon,
    this.color,
    this.child,
    this.height = 50,
    this.radius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        buttonText: '',
        height: 60,
        radius: 8,
        color: Colors.white,
        onPressed: onPressed,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent),
                    child: icon),
              ),
            ),
            Text(
              buttonText,
              style: TextStyles.normal(16),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 40,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent),
                  child: Center(
                      child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey[500],
                  )),
                ),
              ),
            ),
          ],
        ));
  }
}
