import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pasabahce/constants/app_colors.dart';
import 'package:pasabahce/core/router/router.dart';
import 'package:pasabahce/view/intro_screens/componants/dots.dart';
import 'package:pasabahce/view/intro_screens/componants/intro_page_view.dart';
import 'package:pasabahce/view/login/login_screen.dart';

import '../../constants/size_config.dart';
import '../../widgets/main_button.dart';
import '../register/register.dart';
import 'cubit/intro_screens_cubit.dart';

class IntroScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => IntroScreensCubit(),
      child: BlocBuilder<IntroScreensCubit, IntroScreensState>(
        builder: (context, state) {
          final cubit = IntroScreensCubit.get(context);
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
