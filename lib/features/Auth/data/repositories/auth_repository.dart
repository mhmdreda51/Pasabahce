import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use%20case/base_use_case.dart';
import '../../domain/repositories/base_auth_rebo.dart';
import '../../domain/usecases/create_new_user_use_case.dart';
import '../../domain/usecases/reset_password_use_case.dart';
import '../../domain/usecases/signIn_with_phone_use_case.dart';
import '../../domain/usecases/sign_in_use_case.dart';
import '../../domain/usecases/sign_up_use_case.dart';
import '../../domain/usecases/verify_phone_number_use_case.dart';
import '../datasources/auth_data_source.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthDataSource baseAuthDataSource;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  AuthRepository(this.baseAuthDataSource);

  @override
  Future<Either<Failure, User>> signIn(SignInParameters parameters) async {
    try {
      final res = await baseAuthDataSource.signIn(parameters);
      return Right(res.user!);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, User>> signUp(SignUpParameters parameters) async {
    try {
      final res = await baseAuthDataSource.signUp(parameters);
      return Right(res.user!);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle(
      NoParameters parameters) async {
    try {
      final credential = await baseAuthDataSource.signInWithGoogle(parameters);
      var user = (await firebaseAuth.signInWithCredential(credential)).user;
      return Right(user!);
    } on FirebaseException catch (e) {
      print(e.message!);
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> createNewUser(
      CreateNewUserParameters parameters) async {
    try {
      final res = await baseAuthDataSource.createNewUser(parameters);

      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithPhone(
      PhoneSignUpParameters parameters) async {
    try {
      final res = await baseAuthDataSource.signInWithPhoneNumber(parameters);
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> verifyPhoneNumber(
      VerifyPhoneNumberParameters parameters) async {
    try {
      final res = await baseAuthDataSource.verifyPhoneNumber(parameters);
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(
      ResetPasswordParameters parameters) async {
    try {
      final res = await baseAuthDataSource.resetPassword(parameters);
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
