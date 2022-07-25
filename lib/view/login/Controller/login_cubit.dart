import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_colors.dart';
import '../../../core/cacheHelper/get_storage_cache_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  //===============================================================
  static LoginCubit get(context) => BlocProvider.of(context);

//===============================================================
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController emailOrUserController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  Color iconColor = Colors.grey;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

//===============================================================
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    iconColor = isPassword ? Colors.grey : AppColors.brown;
    emit(LoginChangePasswordVisibilityState());
  }

//===============================================================
  bool checkBoxValue = false;

  void checkBoxOnChange(bool? value) {
    checkBoxValue = value!;
    emit(ChangeCheckBox());
  }

//===============================================================
  void loginWithEmail({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      if (!loginFormKey.currentState!.validate()) {
        emit(AuthInitial());
        return;
      }
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email.trim().toLowerCase().toString(),
        password: password.trim().toLowerCase().toString(),
      );
      GetStorageCacheHelper.cacheUid(uid: userCredential.user!.uid);
      print(userCredential.user);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailedState(msg: e.message.toString()));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(LoginFailedState(msg: e.toString()));
    }
  }
}
