import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_auth_rebo.dart';

class SignInWithGoogleUseCase extends BaseUseCase<User, NoParameters> {
  final BaseAuthRepository baseAuthRepository;

  SignInWithGoogleUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, User>> call(NoParameters parameters) async {
    return await baseAuthRepository.signInWithGoogle(parameters);
  }
}
