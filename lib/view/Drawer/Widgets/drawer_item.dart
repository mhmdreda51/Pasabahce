import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pasabahce/constants/app_colors.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final GestureTapCallback onTap;

  const DrawerItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.brown,
        borderRadius: context.locale.languageCode == 'en'
            ? const BorderRadius.horizontal(
                right: Radius.circular(30),
              )
            : const BorderRadius.horizontal(
                left: Radius.circular(30),
              ),
      ),
      child: ListTile(
        title: Row(
          children: <Widget>[
            FaIcon(
              icon,
              color: Colors.black,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
