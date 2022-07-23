import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_context/one_context.dart';
import 'package:pasabahce/view/Home/Controller/home_cubit.dart';
import 'package:pasabahce/view/Home/home_screen.dart';
import 'package:pasabahce/view/intro_screens/intro_screens.dart';
import 'package:pasabahce/widgets/interner_check_dialog.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()..initializeConnectivity()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<HomeCubit, HomeState>(listener: (context, state) {
            if (state is InternetDisconnected) {
              HomeCubit.get(context).isNetDialogShow = true;
              print('InternetDisconnected');
              Future.delayed(const Duration(milliseconds: 500), () {
                //0.5 sec
                OneContext().showDialog(
                  barrierDismissible: false,
                  builder: (context) =>
                      const NoInternetDialog(canDismiss: false),
                );
              });
            }
            if (state is InternetConnected) {
              if (HomeCubit.get(context).isNetDialogShow) {
                print('InternetConnected');
                OneContext().popDialog();
                HomeCubit.get(context).isNetDialogShow = false;
              }
            }
          }),
        ],
        child: MaterialApp(
          title: 'Pasabahce',
          builder: OneContext().builder,
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          navigatorKey: navigatorKey,
          onGenerateRoute: onGenerateRoute,
          home: home,
        ),
      ),
    );
  }
}
