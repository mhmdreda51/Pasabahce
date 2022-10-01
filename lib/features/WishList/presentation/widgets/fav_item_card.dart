import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';

class FavItemCard extends StatelessWidget {
  const FavItemCard(
      {Key? key, required this.image, required this.name, required this.price})
      : super(key: key);
  final String image;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            CachedNetworkImage(
              imageUrl: image,
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
            Text(name),
            SizedBox(height: getScreenHeight(5)),
            Text(price),
          ],
        ),
        Container(
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
