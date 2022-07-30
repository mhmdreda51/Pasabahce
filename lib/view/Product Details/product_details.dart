import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasabahce/constants/app_colors.dart';
import 'package:pasabahce/constants/size_config.dart';

import '../../core/router/router.dart';
import '../../widgets/star_bar.dart';
import '../Home/Componants/similarproducts_list_view.dart';
import '../Home/Controller/home_cubit.dart';
import '../Home/Models/category_product.dart';
import 'Componants/card_icon_with_badge.dart';
import 'Componants/details_tap_bar.dart';
import 'Componants/details_tap_body.dart';
import 'Componants/product_bottom_row.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.item, required this.cubit})
      : super(key: key);
  final Data? item;
  final HomeCubit cubit;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  late int currentTab;
  late TabController tabController;

  @override
  void initState() {
    currentTab = 0;
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    tabController.animation!.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentTab && mounted) {
        changePage(value);
      }
    });
    super.initState();
  }

  void changePage(int newTab) {
    setState(() {
      currentTab = newTab;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: AppColors.blackColor,
      body: ListView(
        children: [
          Container(
            height: getScreenHeight(350),
            width: SizeConfig.screenWidth,
            color: Colors.black,
            child: Image.network(
              widget.item!.image!,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  height: 150,
                  width: 150,
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
                    child: CupertinoActivityIndicator(color: AppColors.brown),
                  ),
                  width: 150,
                  height: 150,
                );
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(
              left: getScreenWidth(10),
              right: getScreenWidth(10),
              top: getScreenHeight(40),
              bottom: getScreenHeight(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.item!.name!,
                  style: TextStyle(
                    fontSize: getScreenWidth(30),
                  ),
                ),
                SizedBox(height: getScreenHeight(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StarsBar(stars: widget.item!.productRev!.toDouble()),
                    SizedBox(width: getScreenWidth(10)),
                    Text(
                      widget.item!.productRevNum!,
                      style: TextStyle(
                        fontSize: getScreenWidth(12),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getScreenHeight(15),
                    left: getScreenWidth(10),
                    right: getScreenWidth(10),
                    bottom: getScreenHeight(30),
                  ),
                  child: Text(
                    widget.item!.subtitle!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getScreenWidth(14),
                      color: AppColors.darkGray,
                    ),
                  ),
                ),
                Text(
                  widget.item!.price!,
                  style: TextStyle(
                    fontSize: getScreenWidth(30),
                    color: AppColors.brown,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getScreenHeight(30),
                    bottom: getScreenHeight(10),
                  ),
                  child: DetailsTapBar(
                    currentTab: currentTab,
                    tabController: tabController,
                  ),
                ),
                DetailsTapBody(
                  tabController: tabController,
                  item: widget.item,
                ),
                Text(
                  "product_details.similar_products".tr(),
                  style: TextStyle(
                    fontSize: getScreenWidth(24),
                    color: AppColors.blackColor,
                  ),
                ),
                SimilarProductsListView(cubit: widget.cubit),
                const ProductBottomRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.detailsAppBarColor,
    title: Text(
      "product_details.appbar_title".tr(),
      style: TextStyle(
        color: AppColors.blackColor,
        fontSize: getScreenWidth(13),
      ),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () => MagicRouter.pop(),
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.blackColor,
        size: getScreenWidth(20),
      ),
    ),
    elevation: 0.0,
    actions: [
      Padding(
        padding: EdgeInsets.only(
          right: context.locale.languageCode == 'en'
              ? getScreenWidth(15)
              : getScreenWidth(0),
          left: context.locale.languageCode == 'en'
              ? getScreenWidth(0)
              : getScreenWidth(15),
        ),
        child: CardIconWithBadge(title: "20", onTap: () {}),
      ),
    ],
  );
}
