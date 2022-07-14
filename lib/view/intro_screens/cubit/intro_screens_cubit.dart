import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pasabahce/core/router/router.dart';

import '../../login/login_screen.dart';
import '../Models/intro_model.dart';

part 'intro_screens_state.dart';

class IntroScreensCubit extends Cubit<IntroScreensState> {
  IntroScreensCubit() : super(IntroScreensInitial());

  static IntroScreensCubit get(context) => BlocProvider.of(context);
  //===============================================================

  void submit() {
    // CacheHelper.saveData(key: onBoarding, value: true).then((value) {
    // });
    MagicRouter.navigateAndPopAll(const LoginScreen());
  }

  //===============================================================
  bool isLast = false;
  final controller = PageController();

  //===============================================================
  onPageChanged(int index) {
    if (index == boardingData.length - 1) {
      isLast = true;
      emit(OnPageChangedState());
    } else {
      isLast = false;
      emit(OnPageChangedState());
    }
  }
}
