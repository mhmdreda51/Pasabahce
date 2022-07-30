import 'package:flutter/material.dart';
import 'package:pasabahce/constants/size_config.dart';
import 'package:pasabahce/view/Product%20Details/Componants/reviews_part.dart';
import 'package:pasabahce/view/Product%20Details/Componants/specification_part.dart';

import '../../Home/Models/category_product.dart';
import 'description_part.dart';

class DetailsTapBody extends StatelessWidget {
  const DetailsTapBody({Key? key, required this.tabController, this.item})
      : super(key: key);
  final TabController tabController;
  final Data? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      padding: EdgeInsets.only(
        left: getScreenWidth(20),
        right: getScreenWidth(20),
      ),
      child: TabBarView(
        controller: tabController,
        children: [
          DescriptionPart(item: item),
          SpecificationPart(item: item),
          ReviewsPart(item: item),
        ],
      ),
    );
  }
}
