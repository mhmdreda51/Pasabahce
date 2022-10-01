import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/size_config.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            style: TextStyle(
              fontSize: getScreenWidth(20),
              color: AppColors.blackColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "home.see_all".tr(),
            style: TextStyle(
              fontSize: getScreenWidth(14),
              color: AppColors.brown,
            ),
          ),
        ),
      ],
    );
  }
}