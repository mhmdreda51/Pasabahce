import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class DetailsTapBar extends StatelessWidget {
  const DetailsTapBar(
      {Key? key, required this.currentTab, required this.tabController})
      : super(key: key);
  final int currentTab;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    const Color unselectedColor = Colors.grey;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.1, color: Colors.grey.withOpacity(0.5)),
        ),
      ),
      child: TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppColors.brown,
            width: 2,
          ),
        ),
        tabs: [
          Text(
            "product_details.Description".tr(),
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14.0,
              color: currentTab == 0 ? AppColors.blackColor : unselectedColor,
            ),
          ),
          Text(
            "product_details.Specifications".tr(),
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12.0,
              color: currentTab == 1 ? AppColors.blackColor : unselectedColor,
            ),
          ),
          Text(
            "product_details.Reviews".tr(),
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14.0,
              color: currentTab == 2 ? AppColors.blackColor : unselectedColor,
            ),
          ),
        ],
      ),
    );
  }
}
