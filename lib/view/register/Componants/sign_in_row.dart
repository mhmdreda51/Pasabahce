import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/router/router.dart';
import '../../login/login_screen.dart';

class SignInRow extends StatelessWidget {
  const SignInRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "register.already_have_an_account".tr(),
          style: const TextStyle(
            color: AppColors.darkGray,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () => MagicRouter.navigateTo(const LoginScreen()),
          child: Text(
            "register.sign_in".tr(),
            style: const TextStyle(
              color: AppColors.darkGray,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
