import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

//===============================================================
  static SettingsCubit get(context) => BlocProvider.of(context);

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
  bool notificationToggle = true;
  String langDropdownValue = 'English';
  List<String> langList = ['English', 'العربية'];

  //===============================================================
  changeLangDropDown({required String value}) {
    langDropdownValue = value;
    emit(ChangeLangDropDown());
  }

//===============================================================
  changeNotificationToggle({required bool value}) {
    notificationToggle = value;
    emit(ChangeNotificationToggle());
  }

//===============================================================

//===============================================================

//===============================================================

}
