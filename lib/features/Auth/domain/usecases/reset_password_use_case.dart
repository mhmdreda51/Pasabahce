import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_auth_rebo.dart';

class ResetPasswordUseCase extends BaseUseCase<void, ResetPasswordParameters> {
  final BaseAuthRepository baseAuthRepository;

  ResetPasswordUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, void>> call(ResetPasswordParameters parameters) async {
    return await baseAuthRepository.resetPassword(parameters);
  }
}

class ResetPasswordParameters extends Equatable {
  final String email;

  const ResetPasswordParameters(
    this.email,
  );

  @override
  List<Object> get props => [email];
}
