import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../widgets/main_button.dart';
import '../pages/login_screen.dart';
import '../widgets/auth_header.dart';

class CheckMailScreen extends StatelessWidget {
  const CheckMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: getScreenHeight(150)),
            child: Column(
              children: [
                Container(
                  height: getScreenHeight(150),
                  width: getScreenWidth(150),
                  decoration: BoxDecoration(
                    color: AppColors.brown.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: getScreenHeight(140),
                    width: getScreenWidth(140),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.brown.withOpacity(.3),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      height: getScreenHeight(130),
                      width: getScreenWidth(130),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppColors.brown,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset("assets/images/arrow.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getScreenHeight(30)),
                const AuthHeader(
                  title: "Check your email",
                  subTitle:
                      "We've sent you instructions on how to reset the password (also check the Spam folder).",
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: getScreenHeight(50)),
            child: MainButton(
              text: "OPEN MY MAIL CLIENT",
              backgroundColor: AppColors.brown,
              height: 44,
              width: 240,
              borderRadius: 22,
              fontSize: 15,
              textColor: Colors.white,
              onTap: () => MagicRouter.navigateTo(const LoginScreen()),
            ),
          ),
        ],
      ),
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
