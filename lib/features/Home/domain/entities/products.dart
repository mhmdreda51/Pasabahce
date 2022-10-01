import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final String id;
  final String type;
  final String diameter;
  final String image;
  final String subtitle;
  final String strapColor;
  final String price;
  final String name;
  final String productionMethod;
  final String productRevNum;
  final String disc;
  final String material;
  final String productOrigin;
  final int productRev;
  final String sale;

  const Products({
    required this.id,
    required this.type,
    required this.diameter,
    required this.image,
    required this.subtitle,
    required this.strapColor,
    required this.price,
    required this.name,
    required this.productionMethod,
    required this.productRevNum,
    required this.disc,
    required this.material,
    required this.productOrigin,
    required this.productRev,
    required this.sale,
  });

  @override
  List<Object> get props => [
        id,
        type,
        diameter,
        image,
        subtitle,
        strapColor,
        price,
        name,
        productionMethod,
        productRevNum,
        disc,
        material,
        productOrigin,
        productRev,
        sale,
      ];
}
