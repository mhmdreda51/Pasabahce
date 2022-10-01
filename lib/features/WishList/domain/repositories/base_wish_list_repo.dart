import 'package:dartz/dartz.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../../../Home/domain/usecases/add_to_wish_list_use_case.dart';
import '../entities/wish_list_entity.dart';

abstract class BaseWishListRepository {
  Future<Either<Failure, List<WishList>>> getWishListItems(
    NoParameters parameters,
  );

  Future<Either<Failure, void>> removeOneItem(
    AddToWishListParameters parameters,
  );

  Future<Either<Failure, void>> clearOnlineWishlist(NoParameters parameters);

  Future<Either<Failure, void>> clearLocalWishlist(NoParameters parameters);
}
