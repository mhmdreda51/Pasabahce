import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';



class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.text,
    this.height = 46,
    this.isIcon = false,
    this.width = double.infinity,
    this.borderRadius = 30,
    this.borderColor = Colors.transparent,
    this.backgroundColor = Colors.transparent,
    this.fontSize = 14,
    this.textColor = Colors.white,
    required this.onTap,
    required this.image,
    required this.imageColor,
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
  final String image;
  final Color imageColor;
  final bool isIcon;
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
            padding: EdgeInsets.only(
                left: getScreenWidth(20), right: getScreenWidth(20))),
        onPressed: onTap,
        child: Row(
          children: [
            isIcon == true
                ? Icon(
                    Icons.phone_iphone_sharp,
                    color: AppColors.liteBlue,
                    size: getScreenWidth(20),
                  )
                : Image(
                    image: AssetImage(image),
                    width: 15,
                    height: 15,
                    color: imageColor,
                  ),
            SizedBox(width: getScreenWidth(15)),
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}