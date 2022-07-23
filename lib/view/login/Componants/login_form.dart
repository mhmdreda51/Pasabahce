import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/Validator/validator.dart';
import '../../../widgets/main_text_form_field.dart';
import '../../../widgets/password_text_form_field.dart';
import '../Controller/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key, required this.cubit}) : super(key: key);
  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MainTextFormField(
          validator: Validator.validateEmail,
          controller: cubit.emailOrUserController,
          label: "login.email_or_username".tr(),
        ),
        const SizedBox(height: 20),
        PasswordTextFormField(
          validator: Validator.validatePassword,
          controller: cubit.passwordController,
          label: "login.password".tr(),
          isObscure: cubit.isPassword,
          onPressed: () => cubit.changePasswordVisibility(),
          icon: cubit.suffix,
          iconColor: cubit.iconColor,
        ),
      ],
    );
  }
}
