import 'package:flutter/material.dart';
import 'package:haba/routes/approuter.dart';
import 'package:haba/utils/colors.dart';

class HomeContainers extends StatelessWidget {
  const HomeContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CustomHomeContainer(
                height: 120,
                icon: Icons.pie_chart,
                text: 'Loan Breakdown',
                color: AppColors.greyPINK),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.personalInfoHome);
              },
              child: CustomHomeContainer(
                  height: 160,
                  icon: Icons.money,
                  text: 'Apply for a loan',
                  color: AppColors.greyDARKGREEN),
            )
          ],
        ),
        Column(
          children: [
            CustomHomeContainer(
                height: 160,
                icon: Icons.wallet,
                text: 'Make loan repayment',
                color: AppColors.greyLIGHTGREEN),
            CustomHomeContainer(
                height: 120,
                icon: Icons.add_circle_outline_outlined,
                text: 'Add payment account',
                color: AppColors.greyCYAN),
          ],
        )
      ],
    );
  }
}

class CustomHomeContainer extends StatelessWidget {
  final double? height;
  final Color? color;
  final String? text;
  final IconData? icon;
  const CustomHomeContainer({
    super.key,
    required this.height,
    required this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Container(
        width: MediaQuery.of(context).size.width * .445,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25,
            right: 5,
          ),
          child: Center(
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 30),
                    child: Container(
                        child: Text(text!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14))),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
