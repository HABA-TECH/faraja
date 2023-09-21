import 'package:flutter/material.dart';
import 'package:haba/utils/colors.dart';

class TranslucentContainer extends StatelessWidget {
  final List<Widget> list;
  final double? height;
  const TranslucentContainer({super.key, this.height, required this.list});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: height ?? MediaQuery.of(context).size.height * 0.59,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor.withOpacity(0.8),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(children: list),
      ),
    );
  }
}
