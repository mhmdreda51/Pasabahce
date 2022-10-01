import 'package:flutter/material.dart';

import '../../../../constants/size_config.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: getScreenHeight(25),
        top: getScreenHeight(40),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: getScreenWidth(20),
        ),
      ),
    );
  }
}
