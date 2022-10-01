import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../widgets/navigation_widget.dart';
import '../../domain/entities/products.dart';
import '../componants/details_body.dart';
import '../componants/header_image.dart';
import '../componants/product_bottom_row.dart';
import '../cubit/home_cubit.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    Key? key,
    required this.cubit,
    required this.item,
  }) : super(key: key);
  final HomeCubit cubit;
  final Products? item;

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
      appBar: appBar(context, widget.cubit),
      backgroundColor: AppColors.blackColor,
      body: ListView(
        children: [
          HeaderImage(image: widget.item!.image),
          DetailsBody(
            item: widget.item!,
            currentTab: currentTab,
            tabController: tabController,
            cubit: widget.cubit,
          ),
        ],
      ),
      bottomNavigationBar:
          ProductBottomRow(cubit: widget.cubit, item: widget.item!),
    );
  }
}

AppBar appBar(BuildContext context, HomeCubit cubit) {
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
        child: IconButton(
          onPressed: () =>
              MagicRouter.navigateTo(const NavigationScreen(currentIndex: 2)),
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: AppColors.blackColor,
            size: getScreenWidth(25),
          ),
        ),
      )
    ],
  );
}
