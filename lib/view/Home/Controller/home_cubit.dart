import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  //===============================================================
  static HomeCubit get(context) => BlocProvider.of(context);

  //===============================================================
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//===============================================================
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
}
