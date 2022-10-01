import 'package:dartz/dartz.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_account_repo.dart';

class LogOutUseCase extends BaseUseCase<void, NoParameters> {
  final BaseAccountRepository baseAccountRepository;

  LogOutUseCase(this.baseAccountRepository);

  @override
  Future<Either<Failure, void>> call(NoParameters parameters) async {
    return await baseAccountRepository.logOut();
  }
}
