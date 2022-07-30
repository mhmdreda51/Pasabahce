import 'package:flutter/material.dart';
import 'package:pasabahce/view/Home/Controller/home_cubit.dart';
import 'package:pasabahce/view/Product%20Details/product_details.dart';

import '../../../constants/size_config.dart';
import '../../../core/router/router.dart';
import '../Models/category_product.dart';
import '../Widgets/top_deal_item_card.dart';

class TopDealsListView extends StatelessWidget {
  const TopDealsListView({Key? key, required this.cubit}) : super(key: key);
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: getScreenHeight(200),
      padding: EdgeInsets.only(top: getScreenHeight(10)),
      child: ListView.separated(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: getScreenWidth(20));
        },
        itemBuilder: (context, index) {
          var item = products[index];
          return GestureDetector(
            onTap: () => MagicRouter.navigateTo(ProductDetails(
              cubit: cubit,
              item: item,
            )),
            child: TopDealItemCard(
              price: item.price!,
              name: item.name!,
              image: item.image!,
              diameter: item.diameter!,
            ),
          );
        },
      ),
    );
  }
}
