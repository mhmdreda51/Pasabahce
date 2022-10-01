import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/size_config.dart';
import '../../data/models/intro_model.dart';

class IntroItem extends StatelessWidget {
  final int index;

  IntroItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: getScreenHeight(25),
        top: getScreenHeight(25),
        right: getScreenWidth(30),
        left: getScreenWidth(30),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: getScreenWidth(300),
            child: Image.asset(boardingData[index].imagePath),
          ),
          Text(
            boardingData[index].price,
            style: TextStyle(fontSize: getScreenWidth(30), color: Colors.white),
          ),
          Text(
            boardingData[index].subTitle,
            style: TextStyle(fontSize: getScreenWidth(13), color: Colors.white),
          ),
          SizedBox(height: getScreenHeight(6)),
          Text(
            boardingData[index].title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: getScreenWidth(35), color: Colors.white),
          ),
        ],
      ),
    );
  }
}
