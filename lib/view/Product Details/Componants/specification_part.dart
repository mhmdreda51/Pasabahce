import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pasabahce/constants/size_config.dart';

import '../../Home/Models/category_product.dart';

class SpecificationPart extends StatelessWidget {
  const SpecificationPart({Key? key, required this.item}) : super(key: key);
  final Data? item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getScreenHeight(400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "product_details.Case_diameter".tr(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                item!.diameter!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: getScreenHeight(5)),
          const Divider(),
          SizedBox(height: getScreenHeight(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "product_details.Product_Origin".tr(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                item!.productOrigin!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: getScreenHeight(5)),
          const Divider(),
          SizedBox(height: getScreenHeight(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "product_details.Production_method".tr(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                item!.productionMethod!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: getScreenHeight(5)),
          const Divider(),
          SizedBox(height: getScreenHeight(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "product_details.Material".tr(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                item!.material!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: getScreenHeight(5)),
          const Divider(),
          SizedBox(height: getScreenHeight(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "product_details.Strap_color".tr(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                item!.strapColor!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: getScreenHeight(5)),
          const Divider(),
        ],
      ),
    );
  }
}
