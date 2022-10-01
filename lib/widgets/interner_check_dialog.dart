import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/size_config.dart';

class NoInternetDialog extends StatelessWidget {
  final bool canDismiss;

  const NoInternetDialog({Key? key, this.canDismiss = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return canDismiss ? true : false;
      },
      child: AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.not_interested, color: AppColors.brown),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'connectivity.not_net_title'.tr(),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: getScreenWidth(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        content: Text(
          'connectivity.not_net_msg'.tr(),
          style: TextStyle(
            color: Colors.grey,
            fontSize: getScreenWidth(12),
          ),
        ),
      ),
    );
  }
}