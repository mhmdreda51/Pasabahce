import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_account_repo.dart';

class UpdateProfileUseCase extends BaseUseCase<void, UpdateProfileParameters> {
  final BaseAccountRepository baseAccountRepository;

  UpdateProfileUseCase(this.baseAccountRepository);

  @override
  Future<Either<Failure, void>> call(UpdateProfileParameters parameters) async {
    return await baseAccountRepository.updateProfile(parameters);
  }
}

class UpdateProfileParameters extends Equatable {
  final String uid, userName, email, phone;

  const UpdateProfileParameters({
    required this.uid,
    required this.userName,
    required this.email,
    required this.phone,
  });

  @override
  List<Object> get props => [uid, userName, email, phone];
}
