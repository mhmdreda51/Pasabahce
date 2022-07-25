part of 'account_cubit.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}

class SignOutLoading extends AccountState {}

class SignOutSuccess extends AccountState {}

class SignOutFailed extends AccountState {}

class UserImageUpdateLoadingState extends AccountState {}

class SocialUploadProfileImageFailedState extends AccountState {}

class UploadProfileInFirebaseSuccessState extends AccountState {}

class PickImageFromGallerySuccess extends AccountState {}

class GetUserDataLoading extends AccountState {}

class GetUserDataSuccessState extends AccountState {}

class GetUserDataFailedState extends AccountState {
  final String msg;

  GetUserDataFailedState({required this.msg});
}
