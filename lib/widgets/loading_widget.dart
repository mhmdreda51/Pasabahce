import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/size_config.dart';

import '../constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: getScreenHeight(400)),
          child: Column(
            children: [
              CupertinoActivityIndicator(
                color: AppColors.brown,
                radius: getScreenWidth(20),
              ),
              SizedBox(height: getScreenHeight(15)),
              Text(
                "loading_widget.loading".tr(),
                style: TextStyle(
                  color: AppColors.brown,
                  fontSize: getScreenWidth(14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}