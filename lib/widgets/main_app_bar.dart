import 'package:flutter/material.dart';

import '../constants/size_config.dart';
import '../core/router/router.dart';

AppBar mainAppBar({required String title}) {
  return AppBar(
    backgroundColor: Colors.black,
    elevation: 0.0,
    leading: IconButton(
      onPressed: () => MagicRouter.pop(),
      icon: Icon(Icons.arrow_back_sharp, size: getScreenWidth(20)),
    ),
    title: Padding(
      padding: EdgeInsets.only(right: getScreenWidth(35)),
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
