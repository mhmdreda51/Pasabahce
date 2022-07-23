import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  //===============================================================
  static HomeCubit get(context) => BlocProvider.of(context);

  //===============================================================
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//===============================================================
  void signOut() async {
    emit(SignOutLoading());
    try {
      await firebaseAuth.signOut();
      emit(SignOutSuccess());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      emit(SignOutFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(SignOutFailed());
    }
  }

//===============================================================

  final _connectivity = Connectivity();
  bool? hasConnection;

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

}
