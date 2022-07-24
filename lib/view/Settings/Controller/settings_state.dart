part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SignOutLoading extends SettingsState {}

class SignOutSuccess extends SettingsState {}

class SignOutFailed extends SettingsState {}

class CheckConnectionLoading extends SettingsState {}

class InternetConnected extends SettingsState {}

class InternetDisconnected extends SettingsState {}

class ChangeNotificationToggle extends SettingsState {}

class ChangeLangDropDown extends SettingsState {}
