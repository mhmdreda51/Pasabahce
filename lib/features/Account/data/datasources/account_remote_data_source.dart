import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../../constants/strings.dart';
import '../../domain/usecases/get_user_data_use_case.dart';
import '../../domain/usecases/update_profile_use_case.dart';
import '../../domain/usecases/upload_profile_image_use_case.dart';
import '../models/user_model.dart';

abstract class BaseAccountRemoteDataSource {
  Future<UserModel> getUserData(GetUserDataParameters parameters);

  Future<void> logOut();

  Future<void> uploadProfileImage(UploadProfileImageParameters parameters);

  Future<void> updateProfile(UpdateProfileParameters parameters);
}

class AccountRemoteDataSource extends BaseAccountRemoteDataSource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Future<UserModel> getUserData(GetUserDataParameters parameters) async {
    var userColl = FirebaseFirestore.instance.collection(userCollection);
    var userData = await userColl.doc(parameters.uid).get();
    return UserModel.fromJson(userData.data()!);
  }

  @override
  Future<void> logOut() async {
    return await firebaseAuth.signOut();
  }

  @override
  Future<void> updateProfile(UpdateProfileParameters parameters) async {
    final userColl = fireStore.collection(userCollection);
    userColl.doc(parameters.uid).get().then((userDoc) {
      final newUser = <String, dynamic>{
        "email": parameters.email,
        "phone": parameters.phone,
        "userName": parameters.userName,
      };
      if (!userDoc.exists) {
        return;
      } else {
        userColl.doc(parameters.uid).update(newUser);
      }
    });
  }

  @override
  Future<void> uploadProfileImage(
      UploadProfileImageParameters parameters) async {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'usersImages/${Uri.file(parameters.image!.path).pathSegments.last}')
        .putFile(parameters.image!)
        .then((value) {
      value.ref.getDownloadURL().then((imageUrl) {
        Map<String, dynamic> updateImage = {};
        updateImage['image'] = imageUrl;
        FirebaseFirestore.instance
            .collection(userCollection)
            .doc(parameters.userEntity!.uId)
            .update(updateImage)
            .then((value) {
          parameters.userEntity!.image = imageUrl;
        });
      });
    });
  }
}
