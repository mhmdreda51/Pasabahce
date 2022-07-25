import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'Componants/drawer_body.dart';
import 'Widgets/drawer_header_body.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.brown,
                  AppColors.redGradientColor,
                ]),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeaderBody(),
              DrawerBody(),
              SizedBox(height: 22.0),
              // DrawerFooter(),              // DrawerFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
