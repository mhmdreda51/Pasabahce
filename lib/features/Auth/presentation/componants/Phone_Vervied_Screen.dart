import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../widgets/main_button.dart';
import '../../../../widgets/navigation_widget.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/auth_header.dart';

class PhoneVerified extends StatelessWidget {
  const PhoneVerified({Key? key, required this.cubit}) : super(key: key);
  final AuthCubit cubit;
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
                      child: const Center(
                        child: Icon(Icons.check, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getScreenHeight(30)),
                const AuthHeader(
                  title: "Phone verified",
                  subTitle:
                      "Congratulations, your phone number has been verified. You can now start using the app.",
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: getScreenHeight(50)),
            child: MainButton(
              text: "CONTINUE",
              backgroundColor: AppColors.brown,
              height: 44,
              width: 240,
              borderRadius: 22,
              fontSize: 15,
              textColor: Colors.white,
              onTap: () => MagicRouter.navigateTo(
                const NavigationScreen(currentIndex: 0),
              ),
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
