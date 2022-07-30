import 'package:flutter/material.dart';

import '../../../constants/size_config.dart';
import '../../../core/router/router.dart';
import '../../Product Details/product_details.dart';
import '../Controller/home_cubit.dart';
import '../Models/category_product.dart';
import '../Widgets/item_card.dart';

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
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: getScreenWidth(5));
        },
        itemBuilder: (context, index) {
          var item = products[index];
          return GestureDetector(
            onTap: () => MagicRouter.navigateTo(ProductDetails(
              item: item,
              cubit: cubit,
            )),
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
