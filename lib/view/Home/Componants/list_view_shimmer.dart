import 'package:flutter/material.dart';
import 'package:pasabahce/constants/size_config.dart';
import 'package:pasabahce/view/Home/Controller/home_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/app_colors.dart';

class ListViewShimmer extends StatelessWidget {
  const ListViewShimmer(
      {Key? key,
      required this.cubit,
      required this.list,
      required this.height,
      required this.cardHeight})
      : super(key: key);
  final HomeCubit cubit;
  final List? list;
  final double height;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: SizeConfig.screenWidth,
      child: ListView.separated(
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        itemCount: list!.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          return SizedBox(height: getScreenHeight(10));
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Shimmer.fromColors(
              baseColor: AppColors.detailsAppBarColor,
              highlightColor: AppColors.brown,
              direction: ShimmerDirection.ltr,
              period: const Duration(seconds: 10),
              child: Container(
                height: cardHeight,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: ShapeDecoration(
                  color: AppColors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
