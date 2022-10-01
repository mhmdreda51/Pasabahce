import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/Keyboard Helper/keyboard.dart';
import '../../../../core/helpers/Validator/validator.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/main_app_bar.dart';
import '../../../../widgets/main_button.dart';
import '../../../../widgets/main_container.dart';
import '../../../../widgets/main_text_form_field.dart';
import '../componants/check_mail_screen.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/auth_header.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SendEmailForResetPasswordSuccess) {
            MagicRouter.navigateTo(const CheckMailScreen());
          }
          if (state is SendEmailForResetPasswordFailed) {
            Fluttertoast.showToast(msg: state.msg);
            print(state.msg);
          }
        },
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return state is SendEmailForResetPasswordLoading
              ? const LoadingWidget()
              : Scaffold(
                  appBar: mainAppBar(
                    title: "RESET PASSWORD",
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
                      child: Form(
                        key: cubit.forgetPasswordFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const AuthHeader(
                                  title: "Forgot your password?",
                                  subTitle:
                                      "Enter your email address and we will send you instructions on how to reset your password.",
                                ),
                                MainTextFormField(
                                  controller:
                                      cubit.forgetPasswordEmailController,
                                  validator: (value) =>
                                      Validator.validateEmail(value),
                                  label: "",
                                  hintText: "Email address",
                                ),
                              ],
                            ),
                            MainButton(
                              text: "RECOVER EMAIL",
                              backgroundColor: AppColors.brown,
                              height: 44,
                              width: 240,
                              borderRadius: 22,
                              textColor: Colors.white,
                              onTap: () {
                                if (cubit.forgetPasswordFormKey.currentState!
                                    .validate()) {
                                  cubit.resetPassword(
                                    email: cubit
                                        .forgetPasswordEmailController.text,
                                  );

                                  KeyboardUtil.hideKeyboard(context);
                                  cubit.forgetPasswordEmailController.clear();
                                }
                              },
                            )
                          ],
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
