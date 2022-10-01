import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';



class LangRow extends StatelessWidget {
  const LangRow({
    Key? key,
    required this.text,
    required this.hint,
    required this.value,
    required this.list,
    required this.onChanged,
  }) : super(key: key);
  final String text;

  final String hint;
  final String value;
  final List list;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getScreenHeight(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                  fontSize: getScreenWidth(18),
                  color: AppColors.darkGray,
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: false,
                  hint: Text(hint),
                  value: value,
                  elevation: 1,
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
          SizedBox(height: getScreenHeight(15)),
          const Divider(thickness: .5, color: Colors.grey),
        ],
      ),
    );
  }
}
