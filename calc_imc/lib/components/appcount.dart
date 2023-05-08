import 'package:flutter/material.dart';

import 'appiconbottom.dart';

class AppCount extends StatelessWidget {
  const AppCount({
    Key? key,
    required this.incrementbottom,
    required this.decreasebottom,
  }) : super(key: key);

  final Function incrementbottom;
  final Function decreasebottom;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppIconBottom(
            icon: Icons.add,
            onTap: () {
              incrementbottom();
            }),
        const SizedBox(
          width: 10,
        ),
        AppIconBottom(
            icon: Icons.horizontal_rule_rounded,
            onTap: () {
              decreasebottom();
            }),
      ],
    );
  }
}
