import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({Key? key, required this.title, required this.subTitle})
      : super(key: key);
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getScreenWidth(28),
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getScreenHeight(5),
            right: getScreenWidth(32),
            left: getScreenWidth(32),
            bottom: getScreenHeight(30),
          ),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getScreenWidth(14),
              color: AppColors.darkGray,
            ),
          ),
        ),
      ],
    );
  }
}