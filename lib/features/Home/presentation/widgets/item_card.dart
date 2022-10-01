import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../domain/entities/products.dart';
import '../cubit/home_cubit.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.item,
    required this.cubit,
  }) : super(key: key);
  final Products? item;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getScreenWidth(150),
      height: getScreenHeight(250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: item!.image,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                SizedBox(
              width: double.infinity,
              height: 120,
              child: Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: AppColors.brown,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const SizedBox(
              height: 120,
              child: Center(
                child: Icon(Icons.error, color: Colors.red),
              ),
            ),
          ),
          SizedBox(height: getScreenHeight(10)),
          Text(
            item!.name,
            style: TextStyle(
              fontSize: getScreenWidth(14),
            ),
          ),
          SizedBox(height: getScreenHeight(5)),
          Text(
            item!.price,
            style: TextStyle(
              fontSize: getScreenWidth(20),
            ),
          ),
        ],
      ),
    );
  }
}
