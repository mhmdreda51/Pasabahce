part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class LoginChangePasswordVisibilityState extends AuthState {}

class RegisterChangePasswordVisibilityState extends AuthState {}

class ChangeCheckBox extends AuthState {}

class AuthInitial extends AuthState {}

class OnPageChangedState extends AuthState {}

class AuthLoading extends AuthState {}

class SignInSuccess extends AuthState {}

class SignInFailed extends AuthState {
  final String msg;

  const SignInFailed(this.msg);
}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpFailed extends AuthState {
  final String msg;

  const SignUpFailed(this.msg);
}

class GoogleLoginSuccess extends AuthState {}

class GoogleLoginFailed extends AuthState {
  final String msg;

  const GoogleLoginFailed(this.msg);
}

class LogOutLoading extends AuthState {}

class LogOutSuccess extends AuthState {}

class LogOutFailed extends AuthState {
  final String msg;

  const LogOutFailed({required this.msg});
}

class PhoneAuthLoading extends AuthState {}

class PhoneAuthSuccess extends AuthState {
  final String? phone;
  PhoneAuthSuccess(this.phone);
}

class PhoneAuthFailed extends AuthState {
  final String msg;

  const PhoneAuthFailed({required this.msg});
}

class CreateNewUserLoading extends AuthState {}

class CreateNewUserSuccess extends AuthState {}

class CreateNewUserFailed extends AuthState {
  final String msg;

  const CreateNewUserFailed({required this.msg});
}

class SendEmailForResetPasswordLoading extends AuthState {}

class SendEmailForResetPasswordSuccess extends AuthState {}

class SendEmailForResetPasswordFailed extends AuthState {
  final String msg;
  const SendEmailForResetPasswordFailed({required this.msg});
}

class VerifyPhoneLoading extends AuthState {}

class VerifyPhoneSuccess extends AuthState {
  final String? phone;
  VerifyPhoneSuccess(this.phone);
}

class VerifyPhoneFailed extends AuthState {
  final String msg;

  const VerifyPhoneFailed({required this.msg});
}
