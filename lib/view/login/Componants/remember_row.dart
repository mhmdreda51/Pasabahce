import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pasabahce/constants/size_config.dart';
import 'package:pasabahce/view/login/Controller/login_cubit.dart';

import '../../../constants/app_colors.dart';
import '../../../core/router/router.dart';
import '../../Forgot Password/forgot_password.dart';

class RememberRow extends StatelessWidget {
  const RememberRow({Key? key, required this.cubit}) : super(key: key);
  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: cubit.checkBoxValue,
              onChanged: cubit.checkBoxOnChange,
              activeColor: AppColors.brown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Text(
              "login.remember_me".tr(),
              style: TextStyle(
                fontSize: getScreenWidth(13),
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
        GestureDetector(
          child: Text(
            "login.forgot_password".tr(),
            style: TextStyle(
              fontSize: getScreenWidth(13),
              color: AppColors.blackColor,
            ),
          ),
          onTap: () => MagicRouter.navigateTo(const ForgotPassword()),
        ),
      ],
    );
  }
}
