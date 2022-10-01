import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../widgets/header_row.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/main_container.dart';
import '../../../Auth/presentation/widgets/auth_header.dart';
import '../../../Search/presentation/pages/filter_screen.dart';
import '../componants/collections_list_view.dart';
import '../cubit/home_cubit.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return cubit.productList.isEmpty || state is GetProductsLoading
              ? const LoadingWidget()
              : Scaffold(
                  appBar: appBar(context),
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
                            const AuthHeader(
                              title: "Ottoman Collection Classic Collections",
                              subTitle:
                                  "Search through more than 1000+ watches",
                            ),
                            HeaderRow(
                              title: "Limited Edition",
                              onTap: () {},
                            ),
                            CollectionsListView(cubit: cubit),
                            SizedBox(height: getScreenHeight(20)),
                            HeaderRow(
                              title: "Anatolian Civilizations Catalog",
                              onTap: () {},
                            ),
                            CollectionsListView(cubit: cubit),
                            SizedBox(height: getScreenHeight(20)),
                            HeaderRow(
                              title: "Zevk-i Selim Catalog",
                              onTap: () {},
                            ),
                            CollectionsListView(cubit: cubit),
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

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.blackColor,
    title: Text(
      "CATEGORIES",
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: getScreenWidth(13),
      ),
    ),
    centerTitle: true,
    leading: const SizedBox(),
    elevation: 0.0,
    actions: [
      Padding(
          padding: EdgeInsets.only(
            right: context.locale.languageCode == 'en'
                ? getScreenWidth(10)
                : getScreenWidth(0),
            left: context.locale.languageCode == 'en'
                ? getScreenWidth(0)
                : getScreenWidth(10),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.filter_alt_outlined),
                onPressed: () => MagicRouter.navigateTo(const FilterScreen()),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          )),
    ],
  );
}
