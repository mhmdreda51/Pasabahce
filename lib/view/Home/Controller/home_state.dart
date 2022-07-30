part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class AppChangeBottomNavState extends HomeState {}

class GetProductsDataLoading extends HomeState {}

class GetProductsDataSuccess extends HomeState {}

class GetProductsDataFailed extends HomeState {}
