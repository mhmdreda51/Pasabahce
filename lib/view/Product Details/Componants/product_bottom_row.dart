import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/size_config.dart';
import '../../../widgets/main_button.dart';

class ProductBottomRow extends StatelessWidget {
  const ProductBottomRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: getScreenWidth(50),
              height: getScreenHeight(50),
              decoration: BoxDecoration(
                color: AppColors.detailsAppBarColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark,
                  color: AppColors.blackColor,
                  size: getScreenWidth(20),
                ),
              ),
            ),
            MainButton(
              text: "product_details.add_to_cart".tr(),
              width: getScreenWidth(200),
              backgroundColor: AppColors.brown,
              fontSize: getScreenWidth(15),
              onTap: () {},
            ),
            Container(
              width: getScreenWidth(50),
              height: getScreenHeight(50),
              decoration: BoxDecoration(
                color: AppColors.detailsAppBarColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: AppColors.blackColor,
                  size: getScreenWidth(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
