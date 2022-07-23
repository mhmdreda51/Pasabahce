import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pasabahce/view/register/controller/register_cubit.dart';

import '../../../constants/size_config.dart';
import '../../../core/Validator/validator.dart';
import '../../../widgets/main_text_form_field.dart';
import '../../../widgets/password_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key, required this.cubit}) : super(key: key);
  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MainTextFormField(
          validator: Validator.validateName,
          controller: cubit.userNameController,
          label: "register.user_name".tr(),
        ),
        SizedBox(height: getScreenHeight(20)),
        MainTextFormField(
          validator: (value) => Validator.validateEmail(value),
          controller: cubit.emailController,
          label: "register.email".tr(),
        ),
        SizedBox(height: getScreenHeight(20)),
        PasswordTextFormField(
          validator: (value) => Validator.validatePassword(value),
          controller: cubit.passwordController,
          label: "register.password".tr(),
          isObscure: cubit.isPassword,
          onPressed: () => cubit.changePasswordVisibility(),
          icon: cubit.suffix,
          iconColor: cubit.iconColor,
        ),
        SizedBox(height: getScreenHeight(20)),
        MainTextFormField(
          validator: (value) => Validator.validatePhone(value),
          controller: cubit.phoneController,
          label: "register.phone".tr(),
          isPhone: true,
        ),
        SizedBox(height: getScreenHeight(40)),
      ],
    );
  }
}
