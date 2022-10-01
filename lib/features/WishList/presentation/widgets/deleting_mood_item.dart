import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../domain/entities/wish_list_entity.dart';
import '../cubit/wishlist_cubit.dart';

class DeletingMoodItem extends StatelessWidget {
  const DeletingMoodItem({Key? key, required this.cubit, required this.item})
      : super(key: key);
  final WishlistCubit cubit;
  final WishList item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            CachedNetworkImage(
              imageUrl: item.image,
              height: getScreenHeight(100),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  SizedBox(
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: AppColors.brown,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const SizedBox(
                child: Center(
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: getScreenHeight(15)),
            Text(item.name),
            SizedBox(height: getScreenHeight(5)),
            Text(item.price),
          ],
        ),
        cubit.deleting
            ? Container(
                width: getScreenWidth(40),
                height: getScreenHeight(40),
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      cubit.removeOneItem(
                        productId: item.productId,
                        name: item.name,
                        price: item.price,
                        image: item.image,
                      );
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: AppColors.whiteColor,
                      size: getScreenWidth(20),
                    ),
                  ),
                ),
              )
            : Container(
                width: getScreenWidth(40),
                height: getScreenHeight(40),
                decoration: BoxDecoration(
                  color: AppColors.brown.withOpacity(.16),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Icon(
                    Icons.bookmark,
                    color: AppColors.brown,
                    size: getScreenWidth(20),
                  ),
                ),
              ),
      ],
    );
  }
}
