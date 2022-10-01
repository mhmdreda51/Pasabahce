part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetProductsLoading extends HomeState {}

class GetProductsSuccess extends HomeState {}

class GetProductsFailed extends HomeState {
  final String msg;

  GetProductsFailed({required this.msg});
}

class AddToCartLoading extends HomeState {}

class AddToCartSuccess extends HomeState {}

class AddToCartFailed extends HomeState {
  final String msg;

  AddToCartFailed({required this.msg});
}

class AddToWishListLoading extends HomeState {}

class AddToWishListSuccess extends HomeState {}

class AddToWishListFailed extends HomeState {
  final String msg;

  AddToWishListFailed({required this.msg});
}

class GetCartLengthLoading extends HomeState {}

class GetCartLengthSuccess extends HomeState {}

class GetCartLengthFailed extends HomeState {
  final String msg;

  GetCartLengthFailed({required this.msg});
}
