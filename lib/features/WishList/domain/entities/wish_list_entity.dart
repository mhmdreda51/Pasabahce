import 'package:equatable/equatable.dart';

class WishList extends Equatable {
  final String productId, image, price, name;

  const WishList({
    required this.productId,
    required this.image,
    required this.price,
    required this.name,
  });

  @override
  List<Object> get props => [productId, image, price, name];
}
