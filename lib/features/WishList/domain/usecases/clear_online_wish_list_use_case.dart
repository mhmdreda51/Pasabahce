import 'package:dartz/dartz.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../repositories/base_wish_list_repo.dart';

class ClearOnlineWishlistUseCase extends BaseUseCase<void, NoParameters> {
  final BaseWishListRepository baseWishListRepository;

  ClearOnlineWishlistUseCase(this.baseWishListRepository);

  @override
  Future<Either<Failure, void>> call(NoParameters parameters) async {
    return await baseWishListRepository.clearOnlineWishlist(parameters);
  }
}
