import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/use case/base_use_case.dart';
import '../../../Home/domain/usecases/add_to_wish_list_use_case.dart';
import '../../domain/entities/wish_list_entity.dart';
import '../../domain/usecases/clear_ofline_wish_list_use_case.dart';
import '../../domain/usecases/clear_online_wish_list_use_case.dart';
import '../../domain/usecases/get_wish_list_ltems_use_case.dart';
import '../../domain/usecases/remove_one_ltem_use_case.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(
    this.getWishListItemsUseCase,
    this.removeOneItemUseCase,
    this.clearOnlineWishlistUseCase,
    this.clearLocalWishlistUseCase,
  ) : super(WishlistInitial());

  //===============================================================

  static WishlistCubit get(context) => BlocProvider.of(context);

//===============================================================
  GetWishListItemsUseCase getWishListItemsUseCase;
  ClearLocalWishlistUseCase clearLocalWishlistUseCase;
  ClearOnlineWishlistUseCase clearOnlineWishlistUseCase;
  RemoveOneItemUseCase removeOneItemUseCase;

//===============================================================
  List<WishList> wishListItems = [];
  late bool deleting = false;

//===============================================================

  Future getWishListItems() async {
    emit(GetWishListLoading());
    final res = await getWishListItemsUseCase.call(const NoParameters());
    res.fold(
      (l) => {
        emit(GetWishListFailed(l.message)),
      },
      (r) => {
        wishListItems = r,
        emit(GetWishListSuccess()),
      },
    );
  }

//===============================================================

  void changeDeleting() {
    deleting = !deleting;
    emit(ChangeDeletingState());
  }

//===============================================================
  Future<void> removeOneItem({
    required String productId,
    required String image,
    required String price,
    required String name,
  }) async {
    emit(RemoveOneItemLoading());
    final res = await removeOneItemUseCase.call(AddToWishListParameters(
      productId: productId,
      image: image,
      price: price,
      name: name,
    ));
    res.fold(
      (l) => {
        emit(RemoveOneItemFailed(l.message)),
      },
      (r) => {
        emit(RemoveOneItemSuccess()),
      },
    );
  }

//===============================================================
  Future<void> clearOnlineWishlist() async {
    emit(ClearOnlineWishlistLoading());
    final res = await clearOnlineWishlistUseCase.call(const NoParameters());
    res.fold(
      (l) => {
        emit(ClearOnlineWishlistFailed(l.message)),
      },
      (r) => {
        emit(ClearOnlineWishlistSuccess()),
      },
    );
  }

//===============================================================
  Future<void> clearLocalWishlist() async {
    emit(ClearLocalWishlistLoading());
    final res = await clearLocalWishlistUseCase.call(const NoParameters());
    res.fold(
      (l) => {
        emit(ClearLocalWishlistFailed(l.message)),
      },
      (r) => {
        emit(ClearLocalWishlistSuccess()),
      },
    );
  }
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================

}
