import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pasabahce/constants/app_colors.dart';
import 'package:pasabahce/core/router/router.dart';
import 'package:pasabahce/view/intro_screens/Models/intro_model.dart';
import 'package:pasabahce/view/intro_screens/componants/dots.dart';
import 'package:pasabahce/view/intro_screens/componants/intro_page_view.dart';
import 'package:pasabahce/view/login/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/main_button.dart';
import 'cubit/intro_screens_cubit.dart';

class IntroScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroScreensCubit(),
      child: BlocBuilder<IntroScreensCubit, IntroScreensState>(
        builder: (context, state) {
          final cubit = IntroScreensCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 50,
              ),
              child: Column(
                children: <Widget>[
                  DotesIndicator(cubit: cubit),
                  IntroPageView(cubit: cubit),
                  cubit.isLast == true
                      ? Column(
                          children: [
                            MainButton(
                              text: "Sign in",
                              borderColor: Colors.white,
                              width: 240,
                              onTap: () =>
                                  MagicRouter.navigateTo(const LoginScreen()),
                            ),
                            const SizedBox(height: 15),
                            MainButton(
                              text: "Create Account",
                              backgroundColor: AppColors.introColor,
                              borderColor: Colors.transparent,
                              width: 240,
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
                        )
                      : MainButton(
                          text: "NEXT",
                          backgroundColor: AppColors.introColor,
                          borderColor: Colors.transparent,
                          width: 240,
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
