import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error_exceptions/failure.dart';

import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_auth_rebo.dart';

class SingUpUseCase extends BaseUseCase<User, SignUpParameters> {
  final BaseAuthRepository baseAuthRepository;

  SingUpUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, User>> call(SignUpParameters parameters) async {
    return await baseAuthRepository.signUp(parameters);
  }
}

class SignUpParameters extends Equatable {
  final String email;

  final String password;

  const SignUpParameters(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
