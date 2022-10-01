import 'package:dartz/dartz.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../entities/products.dart';
import '../repositories/base_home_repository.dart';

class GetProductsUseCase extends BaseUseCase<List<Products>, NoParameters> {
  final BaseHomeRepository baseHomeRepository;

  GetProductsUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<Products>>> call(NoParameters parameters) async {
    return await baseHomeRepository.getProducts(parameters);
  }
}
