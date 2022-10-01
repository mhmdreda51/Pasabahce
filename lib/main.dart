import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pasabahcee/widgets/navigation_widget.dart';

import 'core/helpers/blocObserver/bloc_observer.dart';
import 'core/helpers/cacheHelper/get_storage_cache_helper.dart';
import 'core/helpers/cacheHelper/shared_cache_helper.dart';
import 'core/helpers/dioHelper/dio_helper.dart';
import 'core/services_locator/services_locator.dart';
import 'features/Auth/presentation/pages/intro_screens.dart';
import 'firebase_options.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //===============================================================
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //===============================================================
  Widget? home;
  FirebaseAuth.instance.userChanges().listen((user) {
    if (user == null) {
      home = const IntroScreens();
    } else {
      home = const NavigationScreen();
    }
    home ??= const NavigationScreen();
  });
  //===============================================================
  Bloc.observer = MyBlocObserver();
  //===============================================================
  await DioHelper.init();
  //===============================================================
  await GetStorageCacheHelper.init();
  //===============================================================
  await SharedCacheHelper.init();
  //===============================================================
  await EasyLocalization.ensureInitialized();
  //===============================================================
  ServicesLocator().init();
  //===============================================================

  runApp(
    EasyLocalization(
      path: 'assets/translation',
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(home: home),
    ),
  );
}
