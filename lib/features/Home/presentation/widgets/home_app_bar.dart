import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/size_config.dart';

AppBar homeAppBar({
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: Colors.black,
    elevation: 0.0,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search,
          size: getScreenWidth(18),
        ),
      ),
    ],
    centerTitle: true,
    leading: const SizedBox(),
    title: Center(
      child: Text(
        "home.appbar_title".tr(),
        style: TextStyle(
          fontSize: getScreenWidth(13),
        ),
      ),
    ),
  );
}
