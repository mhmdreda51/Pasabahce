import 'package:easy_localization/easy_localization.dart';
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
import '../componants/phone_verify.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/auth_header.dart';

class PhoneRegister extends StatelessWidget {
  const PhoneRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is VerifyPhoneSuccess) {
            MagicRouter.navigateTo(PhoneVerify(phone: state.phone!));
          }
          if (state is VerifyPhoneFailed) {
            Fluttertoast.showToast(msg: state.msg);
          }
        },
        builder: (context, state) {
          final cubit = AuthCubit.get(context);
          return state is VerifyPhoneLoading
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
                      child: Form(
                        key: cubit.phoneAuthFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AuthHeader(
                              title: "login.login_title".tr(),
                              subTitle: "login.login_subtitle".tr(),
                            ),
                            MainTextFormField(
                              validator: Validator.validatePhone,
                              controller: cubit.phoneAuthController,
                              label: "register.phone".tr(),
                              isPhone: true,
                            ),
                            SizedBox(height: getScreenHeight(80)),
                            MainButton(
                              text: "register.register_button".tr(),
                              backgroundColor: AppColors.brown,
                              borderColor: Colors.transparent,
                              width: getScreenWidth(240),
                              onTap: () {
                                if (cubit.phoneAuthFormKey.currentState!
                                    .validate()) {
                                  cubit.verifyPhoneNumber(
                                    phoneNumber: cubit.phoneAuthController.text,
                                  );
                                  KeyboardUtil.hideKeyboard(context);
                                }
                              },
                            ),
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
