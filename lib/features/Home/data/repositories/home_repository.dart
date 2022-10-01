import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../../domain/entities/products.dart';
import '../../domain/repositories/base_home_repository.dart';
import '../../domain/usecases/add_to_cart_use_case.dart';
import '../../domain/usecases/add_to_wish_list_use_case.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository(this.baseHomeRemoteDataSource);

  @override
  Future<Either<Failure, List<Products>>> getProducts(
    NoParameters parameters,
  ) async {
    try {
      final res = await baseHomeRemoteDataSource.getProducts();
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> addToWishList(
      AddToWishListParameters parameters) async {
    try {
      final res = await baseHomeRemoteDataSource.addToWishList(parameters);
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> addToCart(
      AddToCartParameters parameters) async {
    try {
      final res = await baseHomeRemoteDataSource.addToCart(parameters);
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, String>> getCartLength(NoParameters parameters) async {
    try {
      final res = await baseHomeRemoteDataSource.getCartLength(parameters);
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
