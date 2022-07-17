import 'package:flutter/material.dart';

import '../core/router/router.dart';

AppBar mainAppBar({required String title}) {
  return AppBar(
    backgroundColor: Colors.black,
    elevation: 0.0,
    leading: IconButton(
      onPressed: () => MagicRouter.pop(),
      icon: const Icon(Icons.arrow_back_sharp, size: 20),
    ),
    title: Padding(
      padding: const EdgeInsets.only(right: 35),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
      ),
    ),
  );
}
