import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_auth_rebo.dart';

class CreateNewUserUseCase extends BaseUseCase<void, CreateNewUserParameters> {
  final BaseAuthRepository baseAuthRepository;

  CreateNewUserUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, void>> call(CreateNewUserParameters parameters) async {
    return await baseAuthRepository.createNewUser(parameters);
  }
}

class CreateNewUserParameters extends Equatable {
  final String email, phone, uid, userName;

  const CreateNewUserParameters({
    required this.email,
    required this.phone,
    required this.uid,
    required this.userName,
  });

  @override
  List<Object> get props => [email, phone, uid, userName];
}
