import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/size_config.dart';
import '../../Home/Models/category_product.dart';

class DescriptionPart extends StatelessWidget {
  const DescriptionPart({Key? key, required this.item}) : super(key: key);
  final Data? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(200),
      padding: EdgeInsets.only(
        left: getScreenWidth(10),
        right: getScreenWidth(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item!.disc!,
            textAlign: TextAlign.center,
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
