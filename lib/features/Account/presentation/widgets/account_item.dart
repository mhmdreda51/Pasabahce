import 'package:flutter/material.dart';

import '../../../../constants/size_config.dart';

class AccountItem extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;
  final bool isLast;

  const AccountItem({
    Key? key,
    required this.text,
    required this.onTap,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getScreenHeight(15),
        bottom: getScreenHeight(15),
      ),
      child: Column(
        children: [
          SizedBox(
            width: SizeConfig.screenWidth,
            height: getScreenHeight(50),
            child: ListTile(
              title: Text(
                text,
                style: TextStyle(
                    color: Colors.black, fontSize: getScreenWidth(16)),
              ),
              onTap: onTap,
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: getScreenWidth(15),
              ),
            ),
          ),
          SizedBox(height: getScreenHeight(5)),
          isLast
              ? SizedBox(height: getScreenHeight(10))
              : const Divider(thickness: .5, color: Colors.grey),
        ],
      ),
    );
  }
}
