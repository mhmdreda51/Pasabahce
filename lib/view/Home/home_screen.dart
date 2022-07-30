import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pasabahce/view/Home/Componants/list_view_shimmer.dart';
import 'package:pasabahce/view/Home/Controller/home_cubit.dart';

import '../../constants/size_config.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/header_row.dart';
import '../../widgets/main_container.dart';
import 'Componants/brand_list_view.dart';
import 'Componants/category_list_view.dart';
import 'Componants/featured_list_view.dart';
import 'Componants/top_deals_list_view.dart';
import 'Models/category_product.dart';
import 'Widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCategoryProductsData(),
      lazy: true,
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Scaffold(
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
                      state is GetProductsDataLoading
                          ? ListViewShimmer(
                              cubit: cubit,
                              list: products,
                              height: 250,
                              cardHeight: 250,
                            )
                          : CategoryListView(cubit: cubit),
                      SizedBox(height: getScreenHeight(15)),
                      HeaderRow(
                        title: "home.top_deals".tr(),
                        onTap: () {},
                      ),
                      state is GetProductsDataLoading
                          ? ListViewShimmer(
                              cubit: cubit,
                              list: products,
                              height: 200,
                              cardHeight: 200,
                            )
                          : TopDealsListView(cubit: cubit),
                      SizedBox(height: getScreenHeight(20)),
                      HeaderRow(
                        title: "home.featured_products".tr(),
                        onTap: () {},
                      ),
                      state is GetProductsDataLoading
                          ? ListViewShimmer(
                              cubit: cubit,
                              list: products,
                              height: 250,
                              cardHeight: 250,
                            )
                          : FeaturedListView(cubit: cubit),
                      HeaderRow(
                        title: "home.search_by_brand".tr(),
                        onTap: () {},
                      ),
                      state is GetProductsDataLoading
                          ? ListViewShimmer(
                              cubit: cubit,
                              list: products,
                              height: 250,
                              cardHeight: 250,
                            )
                          : BrandListView(cubit: cubit),
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
