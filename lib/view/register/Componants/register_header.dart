import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "register.create_your_account".tr(),
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
            "register.register_text".tr(),
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
