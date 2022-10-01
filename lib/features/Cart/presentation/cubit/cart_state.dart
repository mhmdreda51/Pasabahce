part of 'cart_cubit.dart';

abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {}

class ChangeDeletingState extends CartState {}
