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
import '../componants/register_form.dart';
import '../componants/sign_in_row.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/auth_header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Fluttertoast.showToast(msg: "login.success".tr());
            MagicRouter.navigateTo(const NavigationScreen(currentIndex: 0));
          }

          if (state is SignUpFailed) {
            Fluttertoast.showToast(msg: state.msg.toString());
            print(state.msg.toString());
          }
        },
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return state is SignUpLoading
              ? const LoadingWidget()
              : Scaffold(
                  appBar: mainAppBar(
                    title: "register.appBar_title".tr(),
                    context: context,
                    leading: IconButton(
                      onPressed: () => MagicRouter.pop(),
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        size: getScreenWidth(20),
                      ),
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
                                    cubit.signUp(
                                      email: cubit.regEmailController.text,
                                      userName:
                                          cubit.regUserNameController.text,
                                      password:
                                          cubit.regPasswordController.text,
                                      phone: cubit.regPhoneController.text,
                                    );
                                    KeyboardUtil.hideKeyboard(context);
                                  }
                                },
                              ),
                              // RegisterSocialColumn(cubit: cubit),
                              SizedBox(height: getScreenHeight(80)),
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
