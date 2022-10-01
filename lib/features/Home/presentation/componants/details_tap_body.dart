import 'package:flutter/material.dart';
import 'package:pasabahcee/features/Home/presentation/componants/reviews_part.dart';
import 'package:pasabahcee/features/Home/presentation/componants/specification_part.dart';

import '../../../../constants/size_config.dart';
import '../../domain/entities/products.dart';
import '../cubit/home_cubit.dart';
import 'description_part.dart';

class DetailsTapBody extends StatelessWidget {
  const DetailsTapBody(
      {Key? key, required this.tabController, this.item, required this.cubit})
      : super(key: key);
  final TabController tabController;
  final Products? item;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getScreenHeight(250),
      padding: EdgeInsets.only(
        left: getScreenWidth(20),
        right: getScreenWidth(20),
      ),
      child: TabBarView(
        controller: tabController,
        children: [
          DescriptionPart(item: item, cubit: cubit),
          SpecificationPart(item: item),
          ReviewsPart(item: item),
        ],
      ),
    );
  }
}
