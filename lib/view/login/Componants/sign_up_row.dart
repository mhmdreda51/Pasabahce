import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/router/router.dart';
import '../../register/register.dart';

class SignUpRow extends StatelessWidget {
  const SignUpRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "login.no_account".tr(),
          style: const TextStyle(
            color: AppColors.darkGray,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () => MagicRouter.navigateTo(const RegisterScreen()),
          child: Text(
            "login.sign_up".tr(),
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
