import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/size_config.dart';
import '../Controller/home_cubit.dart';
import '../Models/category_product.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.item,
    required this.cubit,
  }) : super(key: key);
  final Data? item;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getScreenWidth(150),
      height: getScreenHeight(250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            item!.image!,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                width: double.infinity,
                height: 120,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.brown,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return const SizedBox(
                child: Center(
                    child: CupertinoActivityIndicator(color: AppColors.brown)),
                height: 120,
              );
            },
          ),
          SizedBox(height: getScreenHeight(10)),
          Text(
            item!.name!,
            style: TextStyle(
              fontSize: getScreenWidth(14),
            ),
          ),
          SizedBox(height: getScreenHeight(5)),
          Text(
            item!.price!,
            style: TextStyle(
              fontSize: getScreenWidth(20),
            ),
          ),
        ],
      ),
    );
  }
}
