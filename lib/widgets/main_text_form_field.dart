import 'package:flutter/material.dart';
import 'package:pasabahce/constants/app_colors.dart';

class MainTextFormField extends StatelessWidget {
  const MainTextFormField({
    Key? key,
    required this.controller,
    required this.validator,
    this.hintText = "",
    required this.label,
  }) : super(key: key);
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      keyboardType: TextInputType.text,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(
            color: AppColors.textFormLabel,
            fontSize: 16,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGray,
            width: .5,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGray,
            width: .5,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGray,
            width: .5,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
