import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_home_repository.dart';

class AddToWishListUseCase extends BaseUseCase<void, AddToWishListParameters> {
  final BaseHomeRepository baseHomeRepository;

  AddToWishListUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, void>> call(AddToWishListParameters parameters) async {
    return await baseHomeRepository.addToWishList(parameters);
  }
}

class AddToWishListParameters extends Equatable {
  final String productId, image, price, name;

  const AddToWishListParameters({
    required this.productId,
    required this.image,
    required this.price,
    required this.name,
  });

  @override
  List<Object> get props => [productId, image, price, name];
}
