import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/size_config.dart';
import '../core/router/router.dart';

AppBar mainAppBar({required String title, required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.black,
    elevation: 0.0,
    leading: IconButton(
      onPressed: () => MagicRouter.pop(),
      icon: Icon(Icons.arrow_back_sharp, size: getScreenWidth(20)),
    ),
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
