import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';

class ItemViewShimmer extends StatelessWidget {
  const ItemViewShimmer({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Shimmer.fromColors(
          baseColor: AppColors.detailsAppBarColor,
          highlightColor: AppColors.brown,
          direction: ShimmerDirection.ltr,
          period: const Duration(seconds: 2),
          child: Container(
            height: getScreenHeight(250),
            width: height,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: ShapeDecoration(
              color: AppColors.brown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
