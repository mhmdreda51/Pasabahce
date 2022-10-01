import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../widgets/main_button.dart';
import '../cubit/search_cubit.dart';

class FilterButtonsColumn extends StatelessWidget {
  const FilterButtonsColumn({Key? key, required this.cubit}) : super(key: key);
  final SearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: getScreenHeight(20),
        top: getScreenHeight(30),
      ),
      child: Column(
        children: [
          MainButton(
            text: "filter.apply".tr(),
            onTap: () {},
            width: 200,
            backgroundColor: AppColors.brown,
          ),
          const SizedBox(height: 15),
          MainButton(
            text: "filter.clear_filters".tr(),
            onTap: () {},
            width: 200,
            textColor: Colors.black,
            backgroundColor: AppColors.brown.withOpacity(.16),
          ),
        ],
      ),
    );
  }
}
