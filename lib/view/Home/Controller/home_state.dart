part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class SignOutLoading extends HomeState {}

class SignOutSuccess extends HomeState {}

class SignOutFailed extends HomeState {}
