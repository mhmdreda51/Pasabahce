import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_home_repository.dart';

class AddToCartUseCase extends BaseUseCase<void, AddToCartParameters> {
  final BaseHomeRepository baseHomeRepository;

  AddToCartUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, void>> call(AddToCartParameters parameters) async {
    return await baseHomeRepository.addToCart(parameters);
  }
}

class AddToCartParameters extends Equatable {
  final String productId;

  const AddToCartParameters(this.productId);

  @override
  List<Object> get props => [productId];
}
