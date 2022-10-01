import 'package:dartz/dartz.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../entities/products.dart';
import '../usecases/add_to_cart_use_case.dart';
import '../usecases/add_to_wish_list_use_case.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<Products>>> getProducts(NoParameters parameters);
  Future<Either<Failure, String>> getCartLength(NoParameters parameters);

  Future<Either<Failure, void>> addToCart(AddToCartParameters parameters);

  Future<Either<Failure, void>> addToWishList(
      AddToWishListParameters parameters);
}
