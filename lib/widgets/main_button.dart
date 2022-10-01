import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.text,
    this.height = 46,
    this.width = double.infinity,
    this.borderRadius = 30,
    this.borderColor = Colors.transparent,
    this.backgroundColor = Colors.transparent,
    this.fontSize = 18,
    this.textColor = Colors.white,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final double height;
  final double width;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final double fontSize;
  final Color textColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
