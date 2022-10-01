import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';



class LocationRow extends StatelessWidget {
  const LocationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "settings.location".tr(),
              style: TextStyle(
                fontSize: getScreenWidth(18),
                color: AppColors.darkGray,
              ),
            ),
            GestureDetector(
              onTap: () {
                //todo change location on tap fun
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
        SizedBox(height: getScreenHeight(10)),
        Text(
          "Istanbul, TR",
          style: TextStyle(
            fontSize: getScreenWidth(14),
            color: AppColors.darkGray,
          ),
        ),
        SizedBox(height: getScreenHeight(15)),
        const Divider(thickness: .5, color: Colors.grey),
      ],
    );
  }
}
