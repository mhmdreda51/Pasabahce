import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:pasabahce/constants/app_colors.dart';

import '../../../constants/strings.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  //===============================================================
  static RegisterCubit get(context) => BlocProvider.of(context);

//===============================================================
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  Color iconColor = Colors.grey;

//===============================================================
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    iconColor = isPassword ? Colors.grey : AppColors.brown;
    emit(RegisterChangePasswordVisibilityState());
  }

//===============================================================
  void signUpWithEmail({
    required String email,
    required String userName,
    required String password,
    required String phone,
  }) async {
    emit(SignUpLoadingState());
    try {
      if (!registerFormKey.currentState!.validate()) {
        emit(SignUpAuthInitial());
        return;
      }

      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim().toLowerCase(),
        password: password.trim(),
      );
      final User? user = firebaseAuth.currentUser;
      final uid = user!.uid;
      fireStore.collection(userCollection).doc(uid).set({
        "email": email,
        "phone": phone,
        "userName": userName,
        "uId": uid,
        "userWish": [],
        "userCart": [],
        "createdAt": Timestamp.now(),
      });
      print(userCredential.user);
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailedState(msg: e.message.toString()));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(SignUpFailedState(msg: e.toString()));
    }
  }

//===============================================================
  void signInByGoogle() {
    emit(SignUpLoadingState());

    _googleSignIn.signIn().then((googleSignInAccount) {
      googleSignInAccount!.authentication.then((googleSignInAuthentication) {
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
      });
    });
  }

//===============================================================

}
