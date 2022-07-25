import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../constants/strings.dart';
import '../../register/Models/user_model.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());

//===============================================================
  static AccountCubit get(context) => BlocProvider.of(context);

//===============================================================
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signOut() async {
    emit(SignOutLoading());
    try {
      await firebaseAuth.signOut();
      emit(SignOutSuccess());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      emit(SignOutFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(SignOutFailed());
    }
  }

//===============================================================
  File? image;

  void pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    image = File(pickedImage.path);
    emit(PickImageFromGallerySuccess());
  }

//===============================================================
  Future<dynamic> uploadProfileImage() async {
    emit(UserImageUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('usersImages/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((imageUrl) {
        Map<String, dynamic> updateImage = {};
        updateImage['image'] = imageUrl;
        FirebaseFirestore.instance
            .collection(userCollection)
            .doc(userModel!.uId)
            .update(updateImage)
            .then((value) {
          userModel!.image = imageUrl;
          emit(UploadProfileInFirebaseSuccessState());
        }).catchError((onError) {
          emit(SocialUploadProfileImageFailedState());
        });
        print(value);
      }).catchError((onError) {
        emit(SocialUploadProfileImageFailedState());
      });
    }).catchError((onError) {
      emit(SocialUploadProfileImageFailedState());
    });
  }

//===============================================================
  UserModel? userModel;

  void getUserData({
    required String uid,
  }) {
    emit(GetUserDataLoading());
    FirebaseFirestore.instance
        .collection(userCollection)
        .doc(uid)
        .get()
        .then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      // GetStorageCacheHelper.cacheUserModel(userModel: userModel!);
      emit(GetUserDataSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetUserDataFailedState(msg: onError.toString()));
    });
  }
//===============================================================
//===============================================================
//===============================================================

}
