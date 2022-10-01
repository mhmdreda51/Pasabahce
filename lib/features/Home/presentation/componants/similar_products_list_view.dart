import 'package:flutter/material.dart';

import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../cubit/home_cubit.dart';
import '../pages/product_details.dart';
import '../widgets/item_card.dart';

class SimilarProductsListView extends StatelessWidget {
  const SimilarProductsListView({Key? key, required this.cubit})
      : super(key: key);
  final HomeCubit cubit;

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
        itemCount: cubit.productList.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: getScreenWidth(5));
        },
        itemBuilder: (context, index) {
          var item = cubit.productList[index];
          return GestureDetector(
            onTap: () => MagicRouter.navigateTo(
              ProductDetails(
                cubit: cubit,
                item: item,
              ),
            ),
            child: ItemCard(
              item: item,
              cubit: cubit,
            ),
          );
        },
      ),
    );
  }
}
