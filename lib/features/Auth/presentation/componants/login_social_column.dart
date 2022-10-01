import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../cubit/auth_cubit.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../pages/phone_register.dart';
import '../widgets/social_button.dart';
class LoginSocialColumn extends StatelessWidget {
  const LoginSocialColumn({Key? key, required this.cubit}) : super(key: key);
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getScreenHeight(100),
        bottom: getScreenHeight(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SocialButton(
            image: "assets/images/google.png",
            backgroundColor: Colors.transparent,
            borderColor: AppColors.brown,
            width: getScreenWidth(240),
            text: "login.continue_with_google".tr(),
            textColor: AppColors.brown,
            imageColor: AppColors.brown,
            onTap: () => cubit.googleLogin(),
          ),
          SizedBox(height: getScreenHeight(15)),
          SocialButton(
            image: "",
            isIcon: true,
            backgroundColor: Colors.transparent,
            borderColor: AppColors.liteBlue,
            width: getScreenWidth(240),
            text: "login.continue_with_phone".tr(),
            textColor: AppColors.liteBlue,
            imageColor: AppColors.liteBlue,
            onTap: () => MagicRouter.navigateTo(const PhoneRegister()),
          ),
        ],
      ),
    );
  }
}