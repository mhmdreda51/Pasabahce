import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pasabahce/constants/app_colors.dart';
import 'package:pasabahce/view/register/controller/register_cubit.dart';
import 'package:pasabahce/widgets/main_button.dart';

import '../../widgets/main_app_bar.dart';
import 'Componants/register_form.dart';
import 'Componants/register_header.dart';
import 'Componants/sign_in_row.dart';
import 'Componants/social_column.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: mainAppBar(title: "register.appBar_title".tr()),
            backgroundColor: Colors.black,
            body: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(30),
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.registerFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const RegisterHeader(),
                        RegisterForm(cubit: cubit),
                        MainButton(
                          text: "register.register_button".tr(),
                          backgroundColor: AppColors.brown,
                          borderColor: Colors.transparent,
                          width: 240,
                          onTap: () {},
                        ),
                        SocialColumn(cubit: cubit),
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
