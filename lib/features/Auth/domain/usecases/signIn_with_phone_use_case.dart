import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error_exceptions/failure.dart';

import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_auth_rebo.dart';

class SignInWithPhoneUseCase
    extends BaseUseCase<UserCredential, PhoneSignUpParameters> {
  final BaseAuthRepository baseAuthRepository;

  SignInWithPhoneUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, UserCredential>> call(
      PhoneSignUpParameters parameters) async {
    return await baseAuthRepository.signInWithPhone(parameters);
  }
}

class PhoneSignUpParameters extends Equatable {
  final String sms;

  const PhoneSignUpParameters(this.sms);

  @override
  List<Object> get props => [sms];
}
