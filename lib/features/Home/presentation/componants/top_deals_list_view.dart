import 'package:flutter/material.dart';

import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../cubit/home_cubit.dart';
import '../pages/product_details.dart';
import '../widgets/item_view_shimmer.dart';
import '../widgets/top_deal_item_card.dart';

class TopDealsListView extends StatelessWidget {
  const TopDealsListView({Key? key, required this.cubit, required this.state})
      : super(key: key);
  final HomeCubit cubit;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: getScreenHeight(200),
      padding: EdgeInsets.only(top: getScreenHeight(10)),
      child: ListView.separated(
        itemCount: cubit.productList.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: getScreenWidth(20));
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
            child: state is GetProductsLoading
                ? ItemViewShimmer(
                    width: getScreenWidth(325),
                    height: getScreenHeight(200),
                  )
                : TopDealItemCard(
                    price: item.price,
                    name: item.name,
                    image: item.image,
                    diameter: item.diameter,
                  ),
          );
        },
      ),
    );
  }
}
