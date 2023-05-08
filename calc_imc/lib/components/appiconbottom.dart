import 'package:flutter/material.dart';

class AppIconBottom extends StatelessWidget {
  final IconData icon;
  Color colorbottom;
  final Function onTap;

  AppIconBottom(
      {super.key,
      required this.icon,
      this.colorbottom = Colors.grey,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onTap();
      },
      elevation: 6.0,
      fillColor: colorbottom,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      child: Icon(icon, color: Colors.white, size: 50.0),
    );
  }
}

class AppIconBlockBottom extends StatelessWidget {
  final IconData icon;
  Color colorbottom;
  final Function onTap;
  final String title;

  AppIconBlockBottom(
      {super.key,
      required this.icon,
      this.colorbottom = Colors.grey,
      required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onTap();
      },
      elevation: 6.0,
      fillColor: colorbottom,
      constraints: const BoxConstraints.tightFor(
        width: 126.0,
        height: 36.0,
      ),
      shape: const RoundedRectangleBorder(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30.0),
          const SizedBox(
            width: 10,
          ),
          Text(title),
        ],
      ),
    );
  }
}
