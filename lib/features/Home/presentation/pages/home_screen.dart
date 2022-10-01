import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../constants/size_config.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../widgets/header_row.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/main_container.dart';
import '../../../Auth/presentation/widgets/auth_header.dart';
import '../componants/brand_list_view.dart';
import '../componants/category_list_view.dart';
import '../componants/featured_list_view.dart';
import '../componants/top_deals_list_view.dart';
import '../cubit/home_cubit.dart';
import '../widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          final cubit = HomeCubit.get(context);

          if (state is AddToWishListSuccess) {
            Fluttertoast.showToast(msg: "Item has been added to your wishList");
          }
          if (state is AddToWishListFailed) {
            Fluttertoast.showToast(msg: state.msg);
          }
          if (state is AddToCartSuccess) {
            cubit.getCartLength();
            Fluttertoast.showToast(msg: "Item has been added to your Cart");
          }
          if (state is AddToCartFailed) {
            Fluttertoast.showToast(msg: state.msg);
          }
        },
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return cubit.productList.isEmpty || state is GetProductsLoading
              ? const LoadingWidget()
              : Scaffold(
                  appBar: homeAppBar(context: context),
                  backgroundColor: Colors.black,
                  body: Padding(
                    padding: EdgeInsets.only(
                      top: getScreenHeight(20),
                      bottom: getScreenHeight(50),
                    ),
                    child: MainContainer(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AuthHeader(
                              title: "home.home_title".tr(),
                              subTitle: "home.home_subtitle".tr(),
                            ),
                            HeaderRow(
                              title: "home.categories".tr(),
                              onTap: () {},
                            ),
                            CategoryListView(cubit: cubit, state: state),
                            SizedBox(height: getScreenHeight(15)),
                            HeaderRow(
                              title: "home.top_deals".tr(),
                              onTap: () {},
                            ),
                            TopDealsListView(cubit: cubit, state: state),
                            SizedBox(height: getScreenHeight(20)),
                            HeaderRow(
                              title: "home.featured_products".tr(),
                              onTap: () {},
                            ),
                            FeaturedListView(cubit: cubit, state: state),
                            HeaderRow(
                              title: "home.search_by_brand".tr(),
                              onTap: () {},
                            ),
                            BrandListView(cubit: cubit, state: state),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
