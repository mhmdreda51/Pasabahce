import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/Account/presentation/pages/account_screen.dart';
import '../features/Cart/presentation/pages/cart_screen.dart';
import '../features/Home/presentation/pages/collections_screen.dart';
import '../features/Home/presentation/pages/home_screen.dart';
import '../features/WishList/presentation/pages/wish_list_screen.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  //===============================================================
  static MainCubit get(context) => BlocProvider.of(context);
  //===============================================================
  int currentIndex = 0;
  final _connectivity = Connectivity();
  bool? hasConnection;
  //===============================================================

  List<Widget> bottomViews = [
    const HomeScreen(),
    const CollectionsScreen(),
    const CartScreen(),
    const WishListScreen(),
    const AccountScreen(),
  ];
  //===============================================================

  void changeBottomViews(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  //===============================================================
  Future<void> initializeConnectivity() async {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    _checkConnection(await _connectivity.checkConnectivity());
  }

  void _connectionChange(ConnectivityResult result) {
    _checkConnection(result);
  }

  Future<bool?> _checkConnection(ConnectivityResult result) async {
    bool? previousConnection;
    if (kIsWeb) {
      hasConnection = true;
      _connectionChangeController(hasConnection!);
    }
    if (hasConnection != null) {
      previousConnection = hasConnection!;
    }

    if (result == ConnectivityResult.none) {
      hasConnection = false;
      if (previousConnection != hasConnection) {
        _connectionChangeController(hasConnection!);
      }
      return hasConnection;
    }

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        if (hasConnection == null) {
          hasConnection = false;
          _connectionChangeController(hasConnection!);
        }
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    if (previousConnection != hasConnection) {
      _connectionChangeController(hasConnection!);
    }

    return hasConnection;
  }

  bool isNetDialogShow = false;

  void _connectionChangeController(bool _hasConnection) {
    if (_hasConnection) {
      emit(InternetConnected());
    } else {
      emit(InternetDisconnected());
    }
  }

  //===============================================================
  //===============================================================

}
