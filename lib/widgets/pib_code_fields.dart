import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../features/Auth/presentation/cubit/auth_cubit.dart';

import '../constants/app_colors.dart';

class PibCodeFields extends StatelessWidget {
  const PibCodeFields({Key? key, required this.cubit}) : super(key: key);
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    late String otpCode;

    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: Colors.black,
      textStyle: const TextStyle(color: Colors.black),
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline,
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: AppColors.brown,
        inactiveColor: AppColors.darkGray,
        inactiveFillColor: AppColors.darkGray,
        activeFillColor: AppColors.brown,
        selectedColor: AppColors.brown,
        selectedFillColor: AppColors.brown,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: false,
      onCompleted: (submitedCode) {
        otpCode = submitedCode;
        print("Completed");
        cubit.submitSmsCode(smsCode: submitedCode);
      },
      onChanged: (value) {
        print(value);
      },
    );
  }
}
