import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../cubit/auth_cubit.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../widgets/social_button.dart';

class RegisterSocialColumn extends StatelessWidget {
  const RegisterSocialColumn({Key? key, required this.cubit}) : super(key: key);
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: getScreenHeight(35)),
        SocialButton(
            image: "assets/images/google.png",
            backgroundColor: Colors.transparent,
            borderColor: AppColors.brown,
            width: getScreenWidth(240),
            text: "register.continue_with_google".tr(),
            textColor: AppColors.brown,
            imageColor: AppColors.brown,
            onTap: () {}),
        SizedBox(height: getScreenHeight(15)),
        SocialButton(
            image: "assets/images/facebook.png",
            backgroundColor: Colors.transparent,
            borderColor: AppColors.liteBlue,
            width: getScreenWidth(240),
            text: "register.continue_with_facebook".tr(),
            textColor: AppColors.liteBlue,
            imageColor: AppColors.liteBlue,
            onTap: () {}),
        SizedBox(height: getScreenHeight(30)),
      ],
    );
  }
}
