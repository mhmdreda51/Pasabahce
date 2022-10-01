import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../entities/user.dart';
import '../repositories/base_account_repo.dart';

class GetUserDataUseCase
    extends BaseUseCase<UserEntity, GetUserDataParameters> {
  final BaseAccountRepository baseAccountRepository;

  GetUserDataUseCase(this.baseAccountRepository);

  @override
  Future<Either<Failure, UserEntity>> call(
      GetUserDataParameters parameters) async {
    return await baseAccountRepository.getUserData(parameters);
  }
}

class GetUserDataParameters extends Equatable {
  final String uid;

  const GetUserDataParameters({
    required this.uid,
  });

  @override
  List<Object> get props => [uid];
}
