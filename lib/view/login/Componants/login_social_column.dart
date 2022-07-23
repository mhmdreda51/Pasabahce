import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pasabahce/view/login/Controller/login_cubit.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/size_config.dart';
import '../../../widgets/social_button.dart';

class LoginSocialColumn extends StatelessWidget {
  const LoginSocialColumn({Key? key, required this.cubit}) : super(key: key);
  final LoginCubit cubit;

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
            onTap: () {},
            backgroundColor: Colors.transparent,
            borderColor: AppColors.brown,
            width: getScreenWidth(240),
            text: "login.continue_with_google".tr(),
            textColor: AppColors.brown,
            imageColor: AppColors.brown,
          ),
          SizedBox(height: getScreenHeight(15)),
          SocialButton(
            image: "assets/images/facebook.png",
            onTap: () {},
            backgroundColor: Colors.transparent,
            borderColor: AppColors.liteBlue,
            width: getScreenWidth(240),
            text: "login.continue_with_facebook".tr(),
            textColor: AppColors.liteBlue,
            imageColor: AppColors.liteBlue,
          ),
        ],
      ),
    );
  }
}
