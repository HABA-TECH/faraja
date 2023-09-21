import 'package:flutter/material.dart';

class DoubleContainer extends StatelessWidget {
  final Widget? child1;
  final Widget? child2;
  const DoubleContainer(
      {super.key, required this.child1, required this.child2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 130.0, left: 35),
      child: Column(
        children: [
          Container(
            height: 90,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
              ),
            ),
            width: MediaQuery.of(context).size.width * .8,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: child1,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Container(
            height: 90,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.zero,
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
            ),
            width: MediaQuery.of(context).size.width * .8,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: child2,
            ),
          ),
        ],
      ),
    );
  }
}

class DoubleContainer2 extends StatelessWidget {
  final Widget? child1;
  final Widget? child2;
  const DoubleContainer2(
      {super.key, required this.child1, required this.child2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
            ),
          ),
          width: MediaQuery.of(context).size.width * .95,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: child1,
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        Container(
          height: 90,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0),
              topRight: Radius.zero,
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
          width: MediaQuery.of(context).size.width * .95,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: child2,
          ),
        ),
      ],
    );
  }
}
