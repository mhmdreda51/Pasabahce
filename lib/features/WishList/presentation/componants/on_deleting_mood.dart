import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../constants/strings.dart';
import '../../../../widgets/main_container.dart';
import '../cubit/wishlist_cubit.dart';
import '../widgets/deleting_mood_item.dart';

class OnDeletingMood extends StatelessWidget {
  const OnDeletingMood({Key? key, required this.cubit}) : super(key: key);
  final WishlistCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getScreenHeight(50),
        bottom: getScreenHeight(50),
      ),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 50),
            child: Text(
              "To remove an item, simply tap on the icon on the bottom right corner of the product.",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.darkGray, fontSize: 14),
            ),
          ),
          MainContainer(
            child: cubit.wishListItems.isNotEmpty
                ? GridView.builder(
                    padding: EdgeInsets.only(left: getScreenWidth(10)),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: cubit.wishListItems.length,
                    itemBuilder: (context, index) {
                      return DeletingMoodItem(
                        cubit: cubit,
                        item: cubit.wishListItems[index],
                      );
                    },
                  )
                : Center(child: Image.network(emptyWishList)),
          ),
        ],
      ),
    );
  }
}
