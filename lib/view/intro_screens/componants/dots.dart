import 'package:flutter/material.dart';
import 'package:pasabahce/view/intro_screens/cubit/intro_screens_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/size_config.dart';
import '../Models/intro_model.dart';

class DotesIndicator extends StatelessWidget {
  const DotesIndicator({Key? key, required this.cubit}) : super(key: key);
  final IntroScreensCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SmoothPageIndicator(
        controller: cubit.controller, // PageController
        count: boardingData.length,
        effect: SwapEffect(
          dotHeight: getScreenHeight(7),
          dotWidth: getScreenWidth(7),
          activeDotColor: AppColors.introColor,
        ),
        onDotClicked: cubit.onPageChanged,
      ),
    );
  }
}
