import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../domain/entities/products.dart';

class CollectionItemCard extends StatelessWidget {
  const CollectionItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Products item;

  // final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //   top: 25,
        //   left: 100,
        //   child: item.isOnSale == true
        //       ? Container(
        //           height: 25,
        //           width: 40,
        //           decoration: const BoxDecoration(
        //             color: AppColors.brown,
        //             borderRadius: BorderRadius.only(
        //               topRight: Radius.circular(10),
        //               bottomLeft: Radius.circular(10),
        //             ),
        //           ),
        //           child: Center(
        //             child: Text(
        //               "- ${item!.sale!} %",
        //               style: const TextStyle(color: Colors.white, fontSize: 12),
        //             ),
        //           ),
        //         )
        //       : const SizedBox(),
        // ),
        // Positioned(
        //   top: 100,
        //   left: 110,
        //   child: item!.isFav == true
        //       ? Container(
        //           width: getScreenWidth(35),
        //           height: getScreenHeight(35),
        //           decoration: BoxDecoration(
        //             color: AppColors.detailsAppBarColor,
        //             borderRadius: BorderRadius.circular(50),
        //           ),
        //           child: Center(
        //             child: IconButton(
        //               onPressed: () {},
        //               icon: Icon(
        //                 Icons.bookmark,
        //                 color: AppColors.brown,
        //                 size: getScreenWidth(15),
        //               ),
        //             ),
        //           ),
        //         )
        //       : const SizedBox(),
        // ),
        SizedBox(
          width: getScreenWidth(150),
          height: getScreenHeight(250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                item.image,
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
                    height: 120,
                    child: Center(
                      child: CupertinoActivityIndicator(color: AppColors.brown),
                    ),
                  );
                },
              ),
              SizedBox(height: getScreenHeight(10)),
              Text(
                item.name,
                style: TextStyle(
                  fontSize: getScreenWidth(14),
                ),
              ),
              SizedBox(height: getScreenHeight(5)),
              Text(
                item.price,
                style: TextStyle(
                  fontSize: getScreenWidth(20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
