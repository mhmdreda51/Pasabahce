import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';

class PhoneVerifyHeader extends StatelessWidget {
  const PhoneVerifyHeader({Key? key, required this.phone}) : super(key: key);
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Enter the 6 digit code sent to:",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        SizedBox(height: getScreenHeight(10)),
        Text(
          phone,
          style: const TextStyle(
            color: AppColors.brown,
            fontSize: 30,
          ),
        ),
        SizedBox(height: getScreenHeight(10)),
        const Text(
          "We've sent a 6 digit code to your phone number. Please enter the verification code.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.darkGray,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}