import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../constants/strings.dart';
import '../../../../core/helpers/Firebase Helper/firebase_messaging_helper.dart';
import '../../../../core/use%20case/base_use_case.dart';
import '../../domain/usecases/create_new_user_use_case.dart';
import '../../domain/usecases/reset_password_use_case.dart';
import '../../domain/usecases/signIn_with_phone_use_case.dart';
import '../../domain/usecases/sign_in_use_case.dart';
import '../../domain/usecases/sign_up_use_case.dart';
import '../../domain/usecases/verify_phone_number_use_case.dart';

abstract class BaseAuthDataSource {
  Future<UserCredential> signIn(SignInParameters parameters);

  Future<UserCredential> signUp(SignUpParameters parameters);

  Future<AuthCredential> signInWithGoogle(NoParameters parameters);

  Future<void> createNewUser(CreateNewUserParameters parameters);

  Future<void> verifyPhoneNumber(VerifyPhoneNumberParameters parameters);

  Future<UserCredential> signInWithPhoneNumber(
      PhoneSignUpParameters parameters);

  Future<void> resetPassword(ResetPasswordParameters parameters);
}

class AuthDataSource extends BaseAuthDataSource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  String globalVerificationId = "";

  @override
  Future<UserCredential> signUp(SignUpParameters parameters) async {
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: parameters.email.trim().toLowerCase().toString(),
      password: parameters.password.trim().toLowerCase().toString(),
    );
    return userCredential;
  }

  @override
  Future<UserCredential> signIn(SignInParameters parameters) async {
    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: parameters.email.trim().toLowerCase().toString(),
      password: parameters.password.trim().toLowerCase().toString(),
    );
    return userCredential;
  }

  @override
  Future<AuthCredential> signInWithGoogle(NoParameters parameters) async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return credential;
  }

  @override
  Future<void> createNewUser(CreateNewUserParameters parameters) async {
    final deviceToken = await FirebaseMessagingHelper.getToken();
    final userColl = fireStore.collection(userCollection);
    final uid = parameters.uid;
    final os = Platform.operatingSystem;

    userColl.doc(uid).get().then((userDoc) {
      final newUser = <String, dynamic>{
        "email": parameters.email,
        "phone": parameters.phone,
        "userName": parameters.userName,
        "uId": uid,
        "userWish": [],
        "userCart": [],
        "createdAt": Timestamp.now(),
        "image": "",
        "deviceToken": deviceToken.toString(),
        "os": os,
        "userOrders": [],
      };
      if (!userDoc.exists) {
        userColl.doc(parameters.uid).set(newUser);
      } else {
        userColl.doc(uid).update(newUser);
      }
    });
  }

  @override
  Future<UserCredential> signInWithPhoneNumber(
      PhoneSignUpParameters parameters) async {
    final AuthCredential authCredential = PhoneAuthProvider.credential(
      verificationId: globalVerificationId,
      smsCode: parameters.sms,
    );

    return await firebaseAuth.signInWithCredential(authCredential);
  }

  @override
  Future<void> verifyPhoneNumber(VerifyPhoneNumberParameters parameters) async {
    phoneVerificationCompleted(AuthCredential authCredential) {
      // ignore: avoid_print

      print("phone verified : Token ${authCredential.token}");
    }

    phoneVerificationFailed(FirebaseAuthException firebaseAuthException) {
      // ignore: avoid_print
      print(
          "phone failed : ${firebaseAuthException.message},${firebaseAuthException.code}");
    }

    phoneCodeAutoRetrievalTimeout(String verificationId) {
      globalVerificationId = verificationId;
      // ignore: avoid_print

      print("time out :$verificationId");
    }

    phoneCodeSent(String verificationId, [int? forceResendingToken]) {
      globalVerificationId = verificationId;
    }

    firebaseAuth.verifyPhoneNumber(
      phoneNumber: "+20${parameters.phoneNumber}",
      verificationCompleted: phoneVerificationCompleted,
      verificationFailed: phoneVerificationFailed,
      timeout: const Duration(seconds: 10),
      codeSent: phoneCodeSent,
      codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
    );
  }

  @override
  Future<void> resetPassword(ResetPasswordParameters parameters) async {
    await firebaseAuth.sendPasswordResetEmail(email: parameters.email);
  }
}
