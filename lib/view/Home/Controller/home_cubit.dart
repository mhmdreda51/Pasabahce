import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/strings.dart';
import '../../Account/account_screen.dart';
import '../../Collections Screen/collections_screen.dart';
import '../Models/category_product.dart';
import '../home_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  //===============================================================
  static HomeCubit get(context) => BlocProvider.of(context);

  //===============================================================
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//===============================================================
  int currentIndex = 0;
  List<Widget> bottomViews = [
    const HomeScreen(),
    const CollectionsScreen(),
    const Scaffold(),
    const Scaffold(),
    const AccountScreen(),
  ];

  void changeBottomViews(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

//===============================================================
  CategoryModel? categoryModel;

  void getCategoryProductsData() {
    emit(GetProductsDataLoading());
    FirebaseFirestore.instance
        .collection(categoryProductsCollection)
        .doc(category)
        .get()
        .then((value) {
      print(value.data());
      print(categoryModel!.data.name);

      categoryModel = CategoryModel.fromJson(value.data()!);
      emit(GetProductsDataSuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetProductsDataFailed());
    });
  }

//===============================================================

//===============================================================

}
