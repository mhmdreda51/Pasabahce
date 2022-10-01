part of 'main_cubit.dart';

abstract class MainState {
  const MainState();
}

class MainInitial extends MainState {}

class AppChangeBottomNavState extends MainState {}

class CheckConnectionLoading extends MainState {}

class InternetConnected extends MainState {}

class InternetDisconnected extends MainState {}
