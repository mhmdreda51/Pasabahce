import 'package:flutter/material.dart';
import 'package:pasabahce/constants/size_config.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;

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
        left: getScreenWidth(30),
        right: getScreenWidth(30),
        top: getScreenHeight(40),
        bottom: getScreenHeight(30),
      ),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: child,
    );
  }
}
