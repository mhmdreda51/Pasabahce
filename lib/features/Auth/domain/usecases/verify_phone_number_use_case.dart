import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error_exceptions/failure.dart';

import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_auth_rebo.dart';

class VerifyPhoneNumberUseCase
    extends BaseUseCase<void, VerifyPhoneNumberParameters> {
  final BaseAuthRepository baseAuthRepository;

  VerifyPhoneNumberUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, void>> call(
      VerifyPhoneNumberParameters parameters) async {
    return await baseAuthRepository.verifyPhoneNumber(parameters);
  }
}

class VerifyPhoneNumberParameters extends Equatable {
  final String phoneNumber;

  const VerifyPhoneNumberParameters(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}
