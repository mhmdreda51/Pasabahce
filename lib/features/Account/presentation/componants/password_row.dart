import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';



class PasswordRow extends StatelessWidget {
  const PasswordRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    passwordController.text = "66855332899999999";
    return Padding(
      padding: EdgeInsets.only(bottom: getScreenHeight(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "settings.password".tr(),
                style: TextStyle(
                  fontSize: getScreenWidth(18),
                  color: AppColors.darkGray,
                ),
              ),
              GestureDetector(
                onTap: () {
                  //todo change password on tap fun
                },
                child: Text(
                  "settings.Change".tr(),
                  style: TextStyle(
                    fontSize: getScreenWidth(14),
                    color: AppColors.brown,
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            enabled: false,
          )
        ],
      ),
    );
  }
}
