import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../cubit/auth_cubit.dart';

import '../../../../constants/size_config.dart';
import '../../../../core/helpers/Validator/validator.dart';
import '../../../../widgets/main_text_form_field.dart';
import '../../../../widgets/password_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key, required this.cubit}) : super(key: key);
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MainTextFormField(
          validator: Validator.validateName,
          controller: cubit.regUserNameController,
          label: "register.user_name".tr(),
        ),
        SizedBox(height: getScreenHeight(20)),
        MainTextFormField(
          validator: (value) => Validator.validateEmail(value),
          controller: cubit.regEmailController,
          label: "register.email".tr(),
        ),
        SizedBox(height: getScreenHeight(20)),
        PasswordTextFormField(
          validator: (value) => Validator.validatePassword(value),
          controller: cubit.regPasswordController,
          label: "register.password".tr(),
          isObscure: cubit.regisPassword,
          onPressed: () => cubit.regChangePasswordVisibility(),
          icon: cubit.regSuffix,
          iconColor: cubit.regIconColor,
        ),
        SizedBox(height: getScreenHeight(20)),
        MainTextFormField(
          validator: (value) => Validator.validateMobile(value),
          controller: cubit.regPhoneController,
          label: "register.phone".tr(),
          isPhone: true,
        ),
        SizedBox(height: getScreenHeight(80)),
      ],
    );
  }
}