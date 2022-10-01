import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../pages/register_screen.dart';

class SignUpRow extends StatelessWidget {
  const SignUpRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "login.no_account".tr(),
          style: TextStyle(
            color: AppColors.darkGray,
            fontSize: getScreenWidth(14),
          ),
        ),
        SizedBox(width: getScreenWidth(5)),
        GestureDetector(
          onTap: () => MagicRouter.navigateTo(const RegisterScreen()),
          child: Text(
            "login.sign_up".tr(),
            style: TextStyle(
              color: AppColors.darkGray,
              fontSize: getScreenWidth(14),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
