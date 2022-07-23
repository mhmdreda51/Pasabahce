import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pasabahce/view/Home/home_screen.dart';
import 'package:pasabahce/view/intro_screens/intro_screens.dart';

import 'core/blocObserver/bloc_observer.dart';
import 'core/cacheHelper/get_storage_cache_helper.dart';
import 'core/cacheHelper/shared_cache_helper.dart';
import 'core/dioHelper/dio_helper.dart';
import 'core/router/router.dart';
import 'firebase_options.dart';

void main() async {
  //===============================================================
  WidgetsFlutterBinding.ensureInitialized();
  //===============================================================
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Widget? home;
  FirebaseAuth.instance.userChanges().listen((user) {
    if (user == null) {
      home = IntroScreens();
    } else {
      home = const HomeScreen();
    }
    home ??= const HomeScreen();
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
  runApp(
    EasyLocalization(
      child: MyApp(home: home!),
      path: 'assets/translation',
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      fallbackLocale: const Locale('en', 'US'),
    ),
  );
  //===============================================================
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.home}) : super(key: key);
  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pasabahce',
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: home,
    );
  }
}
