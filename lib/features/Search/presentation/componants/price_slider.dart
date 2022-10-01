import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../cubit/search_cubit.dart';

class PriceSlider extends StatelessWidget {
  const PriceSlider({Key? key, required this.cubit}) : super(key: key);
  final SearchCubit cubit;
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: 0.0,
      max: 10000.0,
      divisions: 15,
      activeColor: AppColors.brown,
      inactiveColor: AppColors.filterBubble,
      values: cubit.currentRangeValues,
      labels: RangeLabels(
        "\$ ${cubit.currentRangeValues.start.round().toString()}",
        "\$ ${cubit.currentRangeValues.end.round().toString()}",
      ),
      onChanged: cubit.changePriceSlider,
    );
  }
}
