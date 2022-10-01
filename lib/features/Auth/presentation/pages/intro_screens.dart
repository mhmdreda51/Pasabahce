import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import 'register_screen.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../widgets/main_button.dart';
import '../componants/dots.dart';
import '../widgets/intro_page_view.dart';
import 'login_screen.dart';

class IntroScreens extends StatelessWidget {
  const IntroScreens({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: EdgeInsets.only(
                left: getScreenWidth(30),
                right: getScreenWidth(30),
                bottom: getScreenHeight(50),
              ),
              child: Column(
                children: <Widget>[
                  DotesIndicator(cubit: cubit),
                  IntroPageView(cubit: cubit),
                  cubit.isLast == true
                      ? Expanded(
                          child: Column(
                            children: [
                              MainButton(
                                text: "intro.sign_in".tr(),
                                borderColor: Colors.white,
                                width: getScreenWidth(240),
                                onTap: () =>
                                    MagicRouter.navigateTo(const LoginScreen()),
                              ),
                              SizedBox(height: getScreenHeight(10)),
                              MainButton(
                                text: "intro.create_account".tr(),
                                backgroundColor: AppColors.introColor,
                                borderColor: Colors.transparent,
                                width: getScreenWidth(240),
                                onTap: () => MagicRouter.navigateTo(
                                  const RegisterScreen(),
                                ),
                              ),
                            ],
                          ),
                        )
                      : MainButton(
                          text: "intro.start_button".tr(),
                          backgroundColor: AppColors.introColor,
                          borderColor: Colors.transparent,
                          width: getScreenWidth(240),
                          onTap: () {
                            if (cubit.isLast) {
                              cubit.submit();
                            } else {
                              cubit.controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate,
                              );
                            }
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
