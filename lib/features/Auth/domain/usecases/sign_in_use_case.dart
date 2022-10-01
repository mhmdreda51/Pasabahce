import 'package:dartz/dartz.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_auth_rebo.dart';

class SignInUseCase extends BaseUseCase<User, SignInParameters> {
  final BaseAuthRepository baseAuthRepository;

  SignInUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, User>> call(SignInParameters parameters) async {
    return await baseAuthRepository.signIn(parameters);
  }
}

class SignInParameters extends Equatable {
  final String email;
  final String password;

  const SignInParameters(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
