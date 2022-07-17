import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pasabahce/view/register/controller/register_cubit.dart';

import '../../../widgets/main_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key, required this.cubit}) : super(key: key);
  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MainTextFormField(
          validator: () {},
          controller: cubit.userNameController,
          label: "register.user_name".tr(),
        ),
        const SizedBox(height: 20),
        MainTextFormField(
          validator: () {},
          controller: cubit.emailController,
          label: "register.email".tr(),
        ),
        const SizedBox(height: 20),
        MainTextFormField(
          validator: () {},
          controller: cubit.passwordController,
          label: "register.password".tr(),
        ),
        const SizedBox(height: 20),
        MainTextFormField(
          validator: () {},
          controller: cubit.phoneController,
          label: "register.phone".tr(),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
