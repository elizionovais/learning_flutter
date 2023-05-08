import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  AppCard({super.key, required this.cardcolor, this.cardChild});

  final Color cardcolor;
  Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}
