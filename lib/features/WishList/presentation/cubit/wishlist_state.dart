part of 'wishlist_cubit.dart';

abstract class WishlistState {
  const WishlistState();
}

class WishlistInitial extends WishlistState {}

class GetWishListLoading extends WishlistState {}

class GetWishListSuccess extends WishlistState {}

class GetWishListFailed extends WishlistState {
  final String msg;

  GetWishListFailed(this.msg);
}

class ChangeDeletingState extends WishlistState {}

class RemoveOneItemLoading extends WishlistState {}

class RemoveOneItemSuccess extends WishlistState {}

class RemoveOneItemFailed extends WishlistState {
  final String msg;

  RemoveOneItemFailed(this.msg);
}

class ClearOnlineWishlistLoading extends WishlistState {}

class ClearOnlineWishlistSuccess extends WishlistState {}

class ClearOnlineWishlistFailed extends WishlistState {
  final String msg;

  ClearOnlineWishlistFailed(this.msg);
}

class ClearLocalWishlistLoading extends WishlistState {}

class ClearLocalWishlistSuccess extends WishlistState {}

class ClearLocalWishlistFailed extends WishlistState {
  final String msg;

  ClearLocalWishlistFailed(this.msg);
}
