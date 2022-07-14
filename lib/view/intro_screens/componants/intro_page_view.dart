import 'package:flutter/material.dart';

import '../Models/intro_model.dart';
import '../cubit/intro_screens_cubit.dart';
import '../widgets/introItem.dart';

class IntroPageView extends StatelessWidget {
  const IntroPageView({Key? key, required this.cubit}) : super(key: key);
  final IntroScreensCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: PageView.builder(
        controller: cubit.controller,
        onPageChanged: cubit.onPageChanged,
        itemCount: boardingData.length,
        itemBuilder: (context, index) => IntroItem(
          index: index,
        ),
      ),
    );
  }
}
