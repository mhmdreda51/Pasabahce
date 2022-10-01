import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../widgets/main_container.dart';
import '../componants/filter_buttons_column.dart';
import '../componants/price_slider.dart';
import '../componants/select_categories_filter_bubble.dart';
import '../componants/sorted_by_search_bubble.dart';
import '../cubit/search_cubit.dart';
import '../widgets/title_header.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: appBar(context),
            backgroundColor: Colors.black,
            body: Padding(
              padding: EdgeInsets.only(top: getScreenHeight(20)),
              child: MainContainer(
                child: ListView(
                  shrinkWrap: true,
                  primary: true,
                  children: [
                    TitleHeader(title: "filter.Select_categories".tr()),
                    SelectCategoriesFilterBubble(cubit: cubit),
                    TitleHeader(title: "filter.Sort_watches_by".tr()),
                    SortedBySearchBubble(cubit: cubit),
                    TitleHeader(title: "filter.Select_a_price_range".tr()),
                    PriceSlider(cubit: cubit),
                    FilterButtonsColumn(cubit: cubit)
                  ],
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
      "filter.appBar_title".tr(),
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
        child: IconButton(
          onPressed: () => MagicRouter.pop(),
          icon: Icon(
            Icons.close,
            color: Colors.white,
            size: getScreenWidth(25),
          ),
        ),
      ),
    ],
  );
}
