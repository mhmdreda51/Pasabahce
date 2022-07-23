import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

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
          style: const TextStyle(
            fontSize: 28,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            right: 32,
            left: 32,
            bottom: 30,
          ),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.darkGray,
            ),
          ),
        ),
      ],
    );
  }
}
