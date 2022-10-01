import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';

class CardIconWithBadge extends StatelessWidget {
  const CardIconWithBadge({Key? key, required this.onTap, required this.title})
      : super(key: key);
  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Badge(
      position: BadgePosition.topStart(top: 25, start: 25),
      badgeColor: AppColors.brown,
      badgeContent: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: getScreenWidth(10),
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.shopping_bag_outlined,
          color: AppColors.blackColor,
          size: getScreenWidth(25),
        ),
      ),
    );
  }
}
