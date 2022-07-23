part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginChangePasswordVisibilityState extends LoginState {}

class ChangeCheckBox extends LoginState {}

class LoginLoadingState extends LoginState {}

class AuthInitial extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailedState extends LoginState {
  final String msg;

  LoginFailedState({required this.msg});
}
