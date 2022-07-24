import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Settings/settings_screen.dart';
import '../home_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  //===============================================================
  static HomeCubit get(context) => BlocProvider.of(context);

  //===============================================================

//===============================================================

//===============================================================

//===============================================================
  int currentIndex = 0;
  List<Widget> bottomViews = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const SettingsScreen(),
  ];

  void changeBottomViews(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }
}
