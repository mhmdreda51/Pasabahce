import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasabahce/core/router/router.dart';
import 'package:pasabahce/view/Home/home_screen.dart';
import 'package:pasabahce/view/login/Controller/login_cubit.dart';

import '../../constants/app_colors.dart';
import '../../constants/size_config.dart';
import '../../core/Keyboard Helper/keyboard.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/main_button.dart';
import 'Componants/login_form.dart';
import 'Componants/login_social_column.dart';
import 'Componants/remember_row.dart';
import 'Componants/sign_up_row.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Fluttertoast.showToast(msg: "login.success".tr());
            MagicRouter.navigateTo(const HomeScreen());
          }
          if (state is LoginFailedState) {
            Fluttertoast.showToast(msg: "login.failed".tr());
            print(state.msg.toString());
          }
        },
        builder: (context, state) {
          final cubit = LoginCubit.get(context);
          return state is LoginLoadingState
              ? const LoadingWidget()
              : Scaffold(
                  appBar: mainAppBar(title: "login.appBar_title".tr()),
                  backgroundColor: Colors.black,
                  body: Padding(
                    padding: EdgeInsets.only(top: getScreenHeight(10)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.only(
                        left: getScreenWidth(30),
                        right: getScreenWidth(30),
                        top: getScreenHeight(40),
                        bottom: getScreenHeight(30),
                      ),
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight,
                      child: SingleChildScrollView(
                        child: Form(
                          key: cubit.loginFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AuthHeader(
                                title: "login.login_title".tr(),
                                subTitle: "login.login_subtitle".tr(),
                              ),
                              LoginForm(cubit: cubit),
                              SizedBox(height: getScreenHeight(10)),
                              RememberRow(cubit: cubit),
                              SizedBox(height: getScreenHeight(30)),
                              MainButton(
                                text: "login.login".tr(),
                                backgroundColor: AppColors.brown,
                                borderColor: Colors.transparent,
                                width: getScreenWidth(240),
                                onTap: () {
                                  if (cubit.loginFormKey.currentState!
                                      .validate()) {
                                    cubit.loginWithEmail(
                                      email: cubit.emailOrUserController.text,
                                      password: cubit.passwordController.text,
                                    );
                                    KeyboardUtil.hideKeyboard(context);
                                  }
                                },
                              ),
                              LoginSocialColumn(cubit: cubit),
                              const SignUpRow(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
