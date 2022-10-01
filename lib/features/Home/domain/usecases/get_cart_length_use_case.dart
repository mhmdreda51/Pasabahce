import 'package:dartz/dartz.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_home_repository.dart';

class GetCartLengthUseCase extends BaseUseCase<String, NoParameters> {
  final BaseHomeRepository baseHomeRepository;

  GetCartLengthUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, String>> call(NoParameters parameters) async {
    return await baseHomeRepository.getCartLength(parameters);
  }
}
