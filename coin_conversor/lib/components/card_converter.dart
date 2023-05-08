import 'package:flutter/material.dart';

class CardConverter extends StatelessWidget {
  CardConverter({
    Key? key,
    required this.controller,
    this.prefix,
    required this.image,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  String? prefix;
  final String image;
  final String title;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(image: Image.asset(image).image, fit: BoxFit.cover, opacity: 0.5),
          border: Border.all(color: Colors.amber),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Expanded(child: Icon(Icons.monetization_on_sharp)),
                Expanded(
                  flex: 6,
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged as void Function(String)?,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey,
                      labelText: 'Valor',
                      prefixText: prefix,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
