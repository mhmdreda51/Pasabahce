import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../widgets/main_button.dart';
import '../../domain/entities/products.dart';
import '../cubit/home_cubit.dart';

class ProductBottomRow extends StatelessWidget {
  const ProductBottomRow({
    Key? key,
    required this.cubit,
    required this.item,
  }) : super(key: key);
  final HomeCubit cubit;
  final Products item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
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
              onPressed: () async {
                cubit.addToWishList(
                  productId: item.id,
                  name: item.name,
                  image: item.image,
                  price: item.price,
                );
              },
              icon: Icon(
                Icons.bookmark,
                color: Colors.black,
                size: getScreenWidth(20),
              ),
            ),
          ),
          MainButton(
            text: "product_details.add_to_cart".tr(),
            width: getScreenWidth(200),
            backgroundColor: AppColors.brown,
            fontSize: getScreenWidth(15),
            onTap: () => cubit.addToCard(item.id),
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
    );
  }
}
