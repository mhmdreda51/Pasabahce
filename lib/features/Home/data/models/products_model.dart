import '../../domain/entities/products.dart';

class ProductsModel extends Products {
  const ProductsModel({
    required super.id,
    required super.type,
    required super.diameter,
    required super.image,
    required super.subtitle,
    required super.strapColor,
    required super.price,
    required super.name,
    required super.productionMethod,
    required super.productRevNum,
    required super.disc,
    required super.material,
    required super.productOrigin,
    required super.productRev,
    required super.sale,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      image: json['image'] ?? "",
      id: json["id"] ?? "",
      disc: json['disc'] ?? "",
      name: json['name'] ?? "",
      price: json['price'] ?? "",
      diameter: json['diameter'] ?? "",
      material: json['material'] ?? "",
      productionMethod: json['productionMethod'] ?? "",
      productOrigin: json['productOrigin'] ?? "",
      productRev: json['productRev'] ?? 4,
      productRevNum: json['productRevNum'] ?? "",
      strapColor: json['strapColor'] ?? "",
      subtitle: json['subtitle'] ?? "",
      sale: json['sale'] ?? "",
      type: json['type'] ?? "",
    );
  }
}
