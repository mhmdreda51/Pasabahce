import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


import '../../../../core/use case/base_use_case.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user_data_use_case.dart';
import '../../domain/usecases/logout_use_case.dart';
import '../../domain/usecases/update_profile_use_case.dart';
import '../../domain/usecases/upload_profile_image_use_case.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(
    this.logOutUseCase,
    this.getUserDataUseCase,
    this.uploadProfileImageUseCase,
    this.updateProfileUseCase,
  ) : super(AccountInitial());

  //===============================================================

  static AccountCubit get(context) => BlocProvider.of(context);

  //===============================================================
  GetUserDataUseCase getUserDataUseCase;
  LogOutUseCase logOutUseCase;
  UploadProfileImageUseCase uploadProfileImageUseCase;
  UpdateProfileUseCase updateProfileUseCase;

  //===============================================================
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> updateProfileFormKey = GlobalKey<FormState>();
  UserEntity? userEntity;
  File? image;
  bool notificationToggle = true;
  bool newslettersToggle = true;

  String langDropdownValue = 'English';
  List<String> langList = ['English', 'العربية'];
  //===============================================================
  Future<void> getUserData({required String uid}) async {
    emit(GetUserDataLoading());
    final res = await getUserDataUseCase.call(GetUserDataParameters(uid: uid));
    res.fold(
      (l) => {
        emit(GetUserDataFailed(msg: l.message)),
      },
      (r) => {
        userEntity = r,
        emit(GetUserDataSuccess()),
      },
    );
  }

  //===============================================================

  void pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    image = File(pickedImage.path);
    emit(PickImageFromGallerySuccess());
  }

//===============================================================
  Future<void> updateUserProfileImage(File image, UserEntity userEntity) async {
    emit(UpdateProfileLoading());
    try {
      final res = await uploadProfileImageUseCase.call(
          UploadProfileImageParameters(image: image, userEntity: userEntity));
      res.fold(
        (l) => {
          // emit(UpdateImageProfileFailed(msg: l.message)),
        },
        (r) => {
          emit(UpdateImageProfileSuccess()),
        },
      );
    } catch (e) {
      emit(UpdateImageProfileFailed(msg: e.toString()));
    }
  }

//===============================================================
  Future<void> updateUserProfile({
    required String uid,
    required userName,
    required email,
    required phone,
  }) async {
    emit(UpdateProfileLoading());
    final res = await updateProfileUseCase.call(UpdateProfileParameters(
        uid: uid, userName: userName, email: email, phone: phone));
    res.fold(
      (l) => {
        emit(UpdateProfileFailed(msg: l.message)),
      },
      (r) => {
        emit(UpdateProfileSuccess()),
      },
    );
  }

//===============================================================
  Future<void> signOut() async {
    final res = await logOutUseCase.call(const NoParameters());
    res.fold(
      (l) => {
        emit(SignOutFailed(msg: l.message)),
      },
      (r) => {
        emit(SignOutSuccess()),
      },
    );
  }
//===============================================================


  //===============================================================
  changeLangDropDown({required String value}) {
    langDropdownValue = value;
    emit(ChangeLangDropDown());
  }

//===============================================================
  changeNotificationToggle({required bool value}) {
    notificationToggle = value;
    emit(ChangeNotificationToggle());
  }

  //===============================================================

  changeNewslettersToggle({required bool value}) {
    newslettersToggle = value;
    emit(ChangeNewslettersToggle());
  }
//===============================================================
//===============================================================

}
