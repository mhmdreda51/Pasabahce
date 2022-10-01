import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/size_config.dart';
import '../../data/models/filter_button_model.dart';
import '../cubit/search_cubit.dart';

class SortedBySearchBubble extends StatelessWidget {
  const SortedBySearchBubble({Key? key, required this.cubit}) : super(key: key);
  final SearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: sortedByFilterButtonList
          .map(
            (item) => Padding(
              padding: EdgeInsets.symmetric(horizontal: getScreenWidth(8)),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  side: const BorderSide(width: 0.0, color: Colors.transparent),
                  backgroundColor: item.isSelected
                      ? AppColors.brown
                      : AppColors.filterBubble,
                ),
                onPressed: () {
                  item.isSelected = !item.isSelected;
                  cubit.changeSelectedFilterButton();
                },
                child: Text(
                  item.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getScreenWidth(14),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
