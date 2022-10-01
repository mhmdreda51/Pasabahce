import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../cubit/auth_cubit.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../pages/forgot_password.dart';

class RememberRow extends StatelessWidget {
  const RememberRow({Key? key, required this.cubit}) : super(key: key);
  final AuthCubit cubit;

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
              onChanged:(value)=> cubit.checkBoxOnChange(value),
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