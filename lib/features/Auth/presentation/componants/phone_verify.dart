import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Phone_Vervied_Screen.dart';
import 'phone_verify_header.dart';
import '../cubit/auth_cubit.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../core/services_locator/services_locator.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/main_button.dart';
import '../../../../widgets/pib_code_fields.dart';

class PhoneVerify extends StatelessWidget {
  const PhoneVerify({Key? key, required this.phone}) : super(key: key);
  final String phone;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        final cubit = AuthCubit.get(context);

        if (state is PhoneAuthSuccess) {
          MagicRouter.navigateTo(PhoneVerified(cubit: cubit));
        }
        if (state is PhoneAuthFailed) {
          Fluttertoast.showToast(msg: state.msg);
        }
      }, builder: (context, state) {
        final cubit = AuthCubit.get(context);
        return state is PhoneAuthLoading
            ? const LoadingWidget()
            : Scaffold(
                appBar: appBar(),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: getScreenHeight(50),
                        left: getScreenWidth(30),
                        right: getScreenWidth(30),
                      ),
                      child: Column(
                        children: [
                          PhoneVerifyHeader(phone: phone),
                          Padding(
                            padding: EdgeInsets.only(
                              top: getScreenHeight(100),
                            ),
                            child: PibCodeFields(cubit: cubit),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: getScreenHeight(50)),
                      child: Column(
                        children: [
                          Text(
                            "Didn’t receive the SMS?",
                            style: TextStyle(
                              color: AppColors.darkGray,
                              fontSize: getScreenWidth(14),
                            ),
                          ),
                          SizedBox(height: getScreenHeight(20)),
                          MainButton(
                            text: "REQUEST NEW CODE",
                            backgroundColor: AppColors.brown,
                            height: 44,
                            width: 240,
                            borderRadius: 22,
                            fontSize: 15,
                            textColor: Colors.white,
                            onTap: () {
                              cubit.verifyPhoneNumber(phoneNumber: phone);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
      }),
    );
  }
}

AppBar appBar() {
  return AppBar(
    backgroundColor: Colors.grey[50],
    elevation: 0.0,
    leading: const SizedBox(),
    actions: [
      IconButton(
        onPressed: () => MagicRouter.pop(),
        icon: Icon(
          Icons.close,
          color: Colors.black,
          size: getScreenWidth(25),
        ),
      )
    ],
  );
}
