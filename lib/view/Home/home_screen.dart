import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasabahce/view/Home/Controller/home_cubit.dart';

import '../../core/router/router.dart';
import '../../widgets/loading_widget.dart';
import '../login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is SignOutSuccess) {
            MagicRouter.navigateTo(const LoginScreen());
            Fluttertoast.showToast(msg: "Sign Out Success");
          }
        },
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return state is SignOutLoading
              ? const LoadingWidget()
              : Scaffold(
                  body: Center(
                    child: TextButton(
                      child: Text("Log Out"),
                      onPressed: cubit.signOut,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
