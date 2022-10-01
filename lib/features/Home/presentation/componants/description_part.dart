import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../domain/entities/products.dart';
import '../cubit/home_cubit.dart';

class DescriptionPart extends StatelessWidget {
  const DescriptionPart({Key? key, required this.item, required this.cubit})
      : super(key: key);
  final Products? item;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: getScreenHeight(20),
        left: getScreenWidth(10),
        right: getScreenWidth(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item!.disc,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: getScreenWidth(14),
              color: AppColors.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
