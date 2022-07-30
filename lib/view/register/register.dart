import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasabahce/constants/app_colors.dart';
import 'package:pasabahce/constants/size_config.dart';
import 'package:pasabahce/view/register/controller/register_cubit.dart';
import 'package:pasabahce/widgets/main_button.dart';

import '../../core/Keyboard Helper/keyboard.dart';
import '../../core/router/router.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/main_container.dart';
import '../../widgets/navigation_widget.dart';
import 'Componants/register_form.dart';
import 'Componants/register_social_column.dart';
import 'Componants/sign_in_row.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            Fluttertoast.showToast(msg: "login.success".tr());
            MagicRouter.navigateTo(const NavigationScreen());
          }
          if (state is SignUpFailedState) {
            Fluttertoast.showToast(msg: "login.failed".tr());
            print(state.msg.toString());
          }
        },
        builder: (context, state) {
          final cubit = RegisterCubit.get(context);
          return state is SignUpLoadingState
              ? const LoadingWidget()
              : Scaffold(
                  appBar: mainAppBar(
                    title: "register.appBar_title".tr(),
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
                          key: cubit.registerFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AuthHeader(
                                title: "register.create_your_account".tr(),
                                subTitle: "register.register_text".tr(),
                              ),
                              RegisterForm(cubit: cubit),
                              MainButton(
                                text: "register.register_button".tr(),
                                backgroundColor: AppColors.brown,
                                borderColor: Colors.transparent,
                                width: getScreenWidth(240),
                                onTap: () {
                                  if (cubit.registerFormKey.currentState!
                                      .validate()) {
                                    cubit.signUpWithEmail(
                                      email: cubit.emailController.text,
                                      userName: cubit.userNameController.text,
                                      password: cubit.passwordController.text,
                                      phone: cubit.phoneController.text,
                                    );
                                    KeyboardUtil.hideKeyboard(context);
                                  }
                                },
                              ),
                              RegisterSocialColumn(cubit: cubit),
                              const SignInRow(),
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
