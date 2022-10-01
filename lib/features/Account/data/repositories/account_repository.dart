import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/base_account_repo.dart';
import '../../domain/usecases/get_user_data_use_case.dart';
import '../../domain/usecases/update_profile_use_case.dart';
import '../../domain/usecases/upload_profile_image_use_case.dart';
import '../datasources/account_remote_data_source.dart';

class AccountRepository extends BaseAccountRepository {
  BaseAccountRemoteDataSource baseAccountRemoteDataSource;

  AccountRepository(this.baseAccountRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> getUserData(
      GetUserDataParameters parameters) async {
    try {
      final res = await baseAccountRemoteDataSource.getUserData(parameters);
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      final res = await baseAccountRemoteDataSource.logOut();
      return Right(res);
    } on FirebaseException catch (e) {
      return left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(
      UpdateProfileParameters parameters) async {
    try {
      final res = await baseAccountRemoteDataSource.updateProfile(parameters);

      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> uploadProfileImage(
      UploadProfileImageParameters parameters) async {
    try {
      final res =
          await baseAccountRemoteDataSource.uploadProfileImage(parameters);
      return Right(res);
    } on FirebaseException catch (e) {
      return left(ServerFailure(e.message!));
    }
  }
}
