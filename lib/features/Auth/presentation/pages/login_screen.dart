import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/Keyboard Helper/keyboard.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/main_app_bar.dart';
import '../../../../widgets/main_button.dart';
import '../../../../widgets/main_container.dart';
import '../../../../widgets/navigation_widget.dart';
import '../componants/login_form.dart';
import '../componants/login_social_column.dart';
import '../componants/remember_row.dart';
import '../componants/sign_up_row.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/auth_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignInSuccess || state is GoogleLoginSuccess) {
            Fluttertoast.showToast(msg: "login.success".tr());
            MagicRouter.navigateTo(const NavigationScreen());
          }
          if (state is SignInFailed) {
            Fluttertoast.showToast(msg: state.msg.toString());
          }
          if (state is GoogleLoginFailed) {
            Fluttertoast.showToast(msg: state.msg.toString());
          }
        },
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return state is AuthLoading
              ? const LoadingWidget()
              : Scaffold(
                  appBar: mainAppBar(
                    title: "login.appBar_title".tr(),
                    context: context,
                    leading: IconButton(
                      onPressed: () => MagicRouter.pop(),
                      icon: Icon(Icons.arrow_back_sharp,
                          size: getScreenWidth(20)),
                    ),
                  ),
                  backgroundColor: Colors.black,
                  body: Padding(
                    padding: EdgeInsets.only(top: getScreenHeight(20)),
                    child: MainContainer(
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
                                    cubit.signIn(
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
