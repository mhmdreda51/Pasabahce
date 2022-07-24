import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/app_colors.dart';

class LangRow extends StatelessWidget {
  const LangRow(
      {Key? key,
      required this.text,
      required this.hint,
      required this.value,
      required this.list,
      required this.onChanged})
      : super(key: key);
  final String text;
  final String hint;
  final String value;
  final List list;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: const TextStyle(fontSize: 18.0),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: false,
              hint: Text(hint),
              value: value,
              iconSize: 12.0,
              elevation: 1,
              icon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: FaIcon(
                  FontAwesomeIcons.solidEdit,
                  color: AppColors.blackColor,
                ),
              ),
              onChanged: (newValue) => onChanged(newValue),
              items: list
                  .map(
                    (item) => DropdownMenuItem(
                      child: Text(item),
                      value: item,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
