import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';


class NotificationRow extends StatelessWidget {
  const NotificationRow(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.title})
      : super(key: key);
  final bool value;
  final Function onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getScreenHeight(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "settings.notifications".tr(),
                style: TextStyle(
                    fontSize: getScreenWidth(18), color: AppColors.darkGray),
              ),
              CupertinoSwitch(
                trackColor: AppColors.brown.withOpacity(.5),
                activeColor: AppColors.brown,
                value: value,
                onChanged: (value) => onChanged(value),
              ),
            ],
          ),
          SizedBox(height: getScreenHeight(10)),
          Text(
            title,
            style: TextStyle(
              fontSize: getScreenWidth(14),
              color: AppColors.darkGray,
            ),
          ),
          SizedBox(height: getScreenHeight(15)),
          const Divider(thickness: .5, color: Colors.grey),
        ],
      ),
    );
  }
}
