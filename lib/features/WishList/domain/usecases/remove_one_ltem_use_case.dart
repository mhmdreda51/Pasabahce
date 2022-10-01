import 'package:dartz/dartz.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../../../Home/domain/usecases/add_to_wish_list_use_case.dart';
import '../repositories/base_wish_list_repo.dart';

class RemoveOneItemUseCase extends BaseUseCase<void, AddToWishListParameters> {
  final BaseWishListRepository baseWishListRepository;

  RemoveOneItemUseCase(this.baseWishListRepository);

  @override
  Future<Either<Failure, void>> call(AddToWishListParameters parameters) async {
    return await baseWishListRepository.removeOneItem(parameters);
  }
}
