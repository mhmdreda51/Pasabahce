import 'package:dartz/dartz.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../entities/wish_list_entity.dart';
import '../repositories/base_wish_list_repo.dart';

class GetWishListItemsUseCase
    extends BaseUseCase<List<WishList>, NoParameters> {
  final BaseWishListRepository baseWishListRepository;

  GetWishListItemsUseCase(this.baseWishListRepository);

  @override
  Future<Either<Failure, List<WishList>>> call(NoParameters parameters) async {
    return await baseWishListRepository.getWishListItems(parameters);
  }
}
