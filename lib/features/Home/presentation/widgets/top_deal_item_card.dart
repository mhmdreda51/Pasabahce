import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';

class TopDealItemCard extends StatelessWidget {
  const TopDealItemCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.diameter})
      : super(key: key);
  final String image;
  final String name;
  final String price;
  final String diameter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(325),
      height: getScreenHeight(200),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColors.brownGradientColor,
              AppColors.darkBrownGradientColor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 50,
              left: context.locale.languageCode == 'en'
                  ? getScreenWidth(30)
                  : getScreenWidth(0),
              right: context.locale.languageCode == 'ar'
                  ? getScreenWidth(30)
                  : getScreenWidth(0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: getScreenWidth(20),
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: getScreenHeight(10)),
                Text(
                  diameter,
                  style: TextStyle(
                    fontSize: getScreenWidth(14),
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: getScreenHeight(15)),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: getScreenWidth(24),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          CachedNetworkImage(
            height: 150,
            width: 150,
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                SizedBox(
              height: 150,
              width: 150,
              child: Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: AppColors.brown,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const SizedBox(
              width: 150,
              height: 150,
              child: Center(
                child: Icon(Icons.error, color: Colors.red),
              ),
            ),
          ),
          SizedBox(height: getScreenWidth(10)),
        ],
      ),
    );
  }
}
