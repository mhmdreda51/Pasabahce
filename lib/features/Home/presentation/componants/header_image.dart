import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(420),
      width: SizeConfig.screenWidth,
      color: Colors.black,
      child: CachedNetworkImage(
        height: getScreenHeight(350),
        width: SizeConfig.screenWidth,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
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
    );
  }
}
