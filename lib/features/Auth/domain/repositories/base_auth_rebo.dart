import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use%20case/base_use_case.dart';
import '../usecases/create_new_user_use_case.dart';
import '../usecases/reset_password_use_case.dart';
import '../usecases/signIn_with_phone_use_case.dart';
import '../usecases/sign_in_use_case.dart';
import '../usecases/sign_up_use_case.dart';
import '../usecases/verify_phone_number_use_case.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, User>> signIn(SignInParameters parameters);

  Future<Either<Failure, User>> signUp(SignUpParameters parameters);

  Future<Either<Failure, User>> signInWithGoogle(NoParameters parameters);

  Future<Either<Failure, UserCredential>> signInWithPhone(
    PhoneSignUpParameters parameters,
  );

  Future<Either<Failure, void>> verifyPhoneNumber(
    VerifyPhoneNumberParameters parameters,
  );

  Future<Either<Failure, void>> createNewUser(
    CreateNewUserParameters parameters,
  );

  Future<Either<Failure, void>> resetPassword(
    ResetPasswordParameters parameters,
  );
}
