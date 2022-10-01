import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';

import '../../../Home/domain/usecases/add_to_wish_list_use_case.dart';
import '../../domain/entities/wish_list_entity.dart';
import '../../domain/repositories/base_wish_list_repo.dart';
import '../datasources/wish_list_remote_data_source.dart';

class WishListRepository extends BaseWishListRepository {
  BaseWishListRemoteDataSource baseWishListRemoteDataSource;

  WishListRepository(this.baseWishListRemoteDataSource);

  @override
  Future<Either<Failure, List<WishList>>> getWishListItems(
      NoParameters parameters) async {
    try {
      final res =
          await baseWishListRemoteDataSource.getWishListItems(parameters);
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> clearLocalWishlist(
      NoParameters parameters) async {
    try {
      final res =
          await baseWishListRemoteDataSource.clearLocalWishlist(parameters);
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> clearOnlineWishlist(
      NoParameters parameters) async {
    try {
      final res =
          await baseWishListRemoteDataSource.clearOnlineWishlist(parameters);
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> removeOneItem(
      AddToWishListParameters parameters) async {
    try {
      final res = await baseWishListRemoteDataSource.removeOneItem(parameters);
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
