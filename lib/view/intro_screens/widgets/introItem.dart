import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasabahce/constants/app_colors.dart';

import '../Models/intro_model.dart';

class IntroItem extends StatelessWidget {
  final int index;
  IntroItem({required this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.asset(boardingData[index].imagePath),
            ),
            Text(
              boardingData[index].price,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              boardingData[index].subTitle,
              style: const TextStyle(fontSize: 13, color: Colors.white),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              boardingData[index].title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 35, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
