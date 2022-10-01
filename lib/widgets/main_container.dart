import 'package:flutter/material.dart';
import '../constants/size_config.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    Key? key,
    required this.child,
    this.paddingLeft = 30,
    this.paddingRight = 30,
  }) : super(key: key);
  final Widget child;
  final double paddingLeft;
  final double paddingRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(
        left: paddingLeft,
        right: paddingRight,
        top: getScreenHeight(40),
        bottom: getScreenHeight(30),
      ),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: child,
    );
  }
}