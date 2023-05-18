import 'package:flutter/material.dart';
import 'package:haba/utils/colors.dart';

class TranslucentContainer extends StatelessWidget {
  final List<Widget> list;
  const TranslucentContainer({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.59,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.8),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(children: list),
    );
  }
}
