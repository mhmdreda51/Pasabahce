import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.redColor,
    colorScheme: const ColorScheme.light(
        primary: AppColors.redColor, secondary: AppColors.redColor),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
      titleTextStyle:
          Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),
    ),
    dividerTheme:
        const DividerThemeData(color: AppColors.redColor, thickness: 0.5),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: AppColors.blackColor,
        shape: const StadiumBorder(),
        side: const BorderSide(width: 1, color: AppColors.redColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: Theme.of(context).textTheme.headline6,
        primary: AppColors.redColor,
        elevation: 4.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(12.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.redColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.redColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.redColor),
      ),
    ),
  );
}
