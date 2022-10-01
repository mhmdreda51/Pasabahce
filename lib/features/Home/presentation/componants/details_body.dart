import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../widgets/star_bar.dart';
import '../../domain/entities/products.dart';
import '../cubit/home_cubit.dart';
import 'details_tap_bar.dart';
import 'details_tap_body.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    Key? key,
    required this.item,
    required this.tabController,
    required this.currentTab,
    required this.cubit,
  }) : super(key: key);
  final Products? item;
  final TabController tabController;
  final int currentTab;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(
        left: getScreenWidth(10),
        right: getScreenWidth(10),
        top: getScreenHeight(40),
        bottom: getScreenHeight(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item!.name,
            style: TextStyle(
              fontSize: getScreenWidth(30),
            ),
          ),
          SizedBox(height: getScreenHeight(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StarsBar(stars: item!.productRev.toDouble()),
              SizedBox(width: getScreenWidth(10)),
              Text(
                item!.productRevNum,
                style: TextStyle(
                  fontSize: getScreenWidth(12),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getScreenHeight(15),
              left: getScreenWidth(10),
              right: getScreenWidth(10),
              bottom: getScreenHeight(30),
            ),
            child: Text(
              item!.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getScreenWidth(14),
                color: AppColors.darkGray,
              ),
            ),
          ),
          Text(
            item!.price,
            style: TextStyle(
              fontSize: getScreenWidth(30),
              color: AppColors.brown,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getScreenHeight(30),
              bottom: getScreenHeight(10),
            ),
            child: DetailsTapBar(
              currentTab: currentTab,
              tabController: tabController,
            ),
          ),
          DetailsTapBody(
            tabController: tabController,
            item: item,
            cubit: cubit,
          ),
        ],
      ),
    );
  }
}
