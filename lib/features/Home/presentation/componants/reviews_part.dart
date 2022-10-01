import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../widgets/main_button.dart';
import '../../../../widgets/star_bar.dart';
import '../../domain/entities/products.dart';

class ReviewsPart extends StatelessWidget {
  const ReviewsPart({Key? key, required this.item}) : super(key: key);
  final Products? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: getScreenHeight(250),
      padding: EdgeInsets.only(
        top: getScreenHeight(10),
        bottom: getScreenHeight(10),
      ),
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          return SizedBox(height: getScreenHeight(20));
        },
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.2),
                      child: Image.asset(
                        "assets/images/user.png",
                        height: 15,
                        width: 15,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Victor Flexin",
                          style: TextStyle(
                            fontSize: getScreenWidth(16),
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const StarsBar(stars: 4),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "23 September 2019",
                        style: TextStyle(
                          fontSize: getScreenWidth(12),
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getScreenHeight(20)),
                Text(
                  "The dial on this timepiece is extremely unique, as it is a concentric circular pattern that is covered by sturdy sapphire glass.",
                  style: TextStyle(
                    fontSize: getScreenWidth(14),
                    color: AppColors.darkGray,
                  ),
                ),
                SizedBox(height: getScreenHeight(30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainButton(
                      text: "product_details.Helpful".tr(),
                      height: 35,
                      width: 110,
                      backgroundColor: Colors.grey.withOpacity(.2),
                      fontSize: 14,
                      borderRadius: 5,
                      textColor: AppColors.blackColor,
                      onTap: () {},
                    ),
                    MainButton(
                      text: "product_details.Report".tr(),
                      height: 35,
                      width: 110,
                      backgroundColor: Colors.grey.withOpacity(.2),
                      fontSize: 14,
                      borderRadius: 5,
                      textColor: AppColors.brown,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
