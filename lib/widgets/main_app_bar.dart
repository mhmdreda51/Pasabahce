import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/size_config.dart';

AppBar mainAppBar({
  required String title,
  required BuildContext context,
  required Widget actions,
  required Widget leading,
}) {
  return AppBar(
    backgroundColor: Colors.black,
    elevation: 0.0,
    leading: leading,
    actions: [actions],
    title: Padding(
      padding: EdgeInsets.only(
        right: context.locale.languageCode == 'en'
            ? getScreenWidth(35)
            : getScreenWidth(0),
        left: context.locale.languageCode == 'ar'
            ? getScreenWidth(35)
            : getScreenWidth(0),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: getScreenWidth(13),
          ),
        ),
      ),
    ),
  );
}
