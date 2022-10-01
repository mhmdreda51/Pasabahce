import 'package:flutter/material.dart';
import '../cubit/auth_cubit.dart';

import '../../data/models/intro_model.dart';
import 'introItem.dart';

class IntroPageView extends StatelessWidget {
  const IntroPageView({Key? key, required this.cubit}) : super(key: key);
  final AuthCubit cubit;

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
