import 'package:flutter/material.dart';
import '../constants/size_config.dart';

import '../constants/app_colors.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    Key? key,
    required this.controller,
    required this.validator,
    this.hintText = "",
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.isObscure,
    required this.iconColor,
  }) : super(key: key);
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final String label;
  final IconData icon;
  final Function() onPressed;
  final bool isObscure;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      keyboardType: TextInputType.visiblePassword,
      cursorColor: AppColors.brown,
      obscureText: isObscure,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
            color: AppColors.textFormLabel,
            fontSize: getScreenWidth(16),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.brown,
            width: 1,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGray,
            width: 1,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 1,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: getScreenWidth(16),
            color: iconColor,
          ),
        ),
      ),
    );
  }
}