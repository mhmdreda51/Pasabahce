import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 350),
          child: Column(
            children: const [
              CupertinoActivityIndicator(color: AppColors.brown, radius: 20),
              SizedBox(height: 15),
              Text(
                "LOADING",
                style: TextStyle(
                  color: AppColors.brown,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
