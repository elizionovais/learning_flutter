import 'package:flutter/material.dart';

class CalcBottom extends StatelessWidget {
  const CalcBottom(
      {super.key,
      required this.text,
      required this.onPress,
      this.bottomColor = Colors.green});

  final String text;
  final Function onPress;
  final Color bottomColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        color: bottomColor,
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: ThemeData.dark().primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
