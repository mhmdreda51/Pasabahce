import 'package:flutter/material.dart';
import 'package:pasabahce/constants/app_colors.dart';
import 'package:pasabahce/constants/size_config.dart';

class MainTextFormField extends StatelessWidget {
  const MainTextFormField({
    Key? key,
    required this.controller,
    required this.validator,
    this.hintText = "",
    required this.label,
    this.isPhone = false,
  }) : super(key: key);
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final String label;
  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      keyboardType: isPhone ? TextInputType.number : TextInputType.text,
      cursorColor: AppColors.brown,
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
      ),
    );
  }
}
