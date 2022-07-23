part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterChangePasswordVisibilityState extends RegisterState {}

class SignUpLoadingState extends RegisterState {}

class SignUpAuthInitial extends RegisterState {}

class SignUpSuccessState extends RegisterState {}

class SignUpFailedState extends RegisterState {
  final String msg;

  SignUpFailedState({required this.msg});
}

class SignUpGoogleSuccessState extends RegisterState {}

class SignUpGoogleFailedState extends RegisterState {
  final String msg;

  SignUpGoogleFailedState({required this.msg});
}
