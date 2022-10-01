import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_context/one_context.dart';
import 'package:pasabahcee/widgets/interner_check_dialog.dart';

import 'core/helpers/router/router.dart';
import 'main_cubit/main_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.home,
  });

  final Widget? home;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainCubit()..initializeConnectivity()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<MainCubit, MainState>(
            listener: (context, state) {
              if (state is InternetDisconnected) {
                MainCubit.get(context).isNetDialogShow = true;
                Future.delayed(
                  const Duration(milliseconds: 500),
                  () {
                    OneContext().showDialog(
                      barrierDismissible: false,
                      builder: (context) =>
                          const NoInternetDialog(canDismiss: false),
                    );
                  },
                );
              }
              if (state is InternetConnected) {
                if (MainCubit.get(context).isNetDialogShow) {
                  OneContext().popDialog();
                  MainCubit.get(context).isNetDialogShow = false;
                }
              }
            },
          ),
        ],
        child: MaterialApp(
          title: 'Pasabahce',
          debugShowCheckedModeBanner: false,
          builder: OneContext().builder,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          navigatorKey: navigatorKey,
          onGenerateRoute: onGenerateRoute,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: home,
        ),
      ),
    );
  }
}
