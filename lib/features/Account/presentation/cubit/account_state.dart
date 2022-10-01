part of 'account_cubit.dart';

abstract class AccountState {
  const AccountState();
}

class AccountInitial extends AccountState {}

class GetUserDataLoading extends AccountState {}

class GetUserDataSuccess extends AccountState {}

class GetUserDataFailed extends AccountState {
  final String msg;

  GetUserDataFailed({required this.msg});
}

class PickImageFromGallerySuccess extends AccountState {}

class UpdateImageProfileLoading extends AccountState {}

class UpdateImageProfileSuccess extends AccountState {}

class UpdateImageProfileFailed extends AccountState {
  final String msg;

  UpdateImageProfileFailed({required this.msg});
}

class UpdateProfileLoading extends AccountState {}

class UpdateProfileSuccess extends AccountState {}

class UpdateProfileFailed extends AccountState {
  final String msg;

  UpdateProfileFailed({required this.msg});
}

class SignOutLoading extends AccountState {}

class SignOutSuccess extends AccountState {}

class SignOutFailed extends AccountState {
  final String msg;

  SignOutFailed({required this.msg});
}
class ChangeNotificationToggle extends AccountState {}

class ChangeNewslettersToggle extends AccountState {}

class ChangeLangDropDown extends AccountState {}