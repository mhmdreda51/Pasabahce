import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_colors.dart';
import '../../../../core/helpers/cacheHelper/get_storage_cache_helper.dart';
import '../../../../core/helpers/router/router.dart';
import '../../../../core/use case/base_use_case.dart';
import '../../data/models/intro_model.dart';
import '../../domain/usecases/create_new_user_use_case.dart';
import '../../domain/usecases/reset_password_use_case.dart';
import '../../domain/usecases/signIn_with_phone_use_case.dart';
import '../../domain/usecases/sign_in_use_case.dart';
import '../../domain/usecases/sign_in_with_google_use_case.dart';
import '../../domain/usecases/sign_up_use_case.dart';
import '../../domain/usecases/verify_phone_number_use_case.dart';
import '../pages/login_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.signInUseCase,
    this.signInWithGoogleUseCase,
    this.singUpUseCase,
    this.createNewUserUseCase,
    this.verifyPhoneNumberUseCase,
    this.signInWithPhoneUseCase,
    this.resetPasswordUseCase,
  ) : super(AuthInitial());

//===============================================================

  static AuthCubit get(context) => BlocProvider.of(context);

//===============================================================
  final SignInUseCase signInUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final SingUpUseCase singUpUseCase;
  final CreateNewUserUseCase createNewUserUseCase;
  final VerifyPhoneNumberUseCase verifyPhoneNumberUseCase;
  final SignInWithPhoneUseCase signInWithPhoneUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
//===============================================================
  TextEditingController emailOrUserController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> smsFormKey = GlobalKey<FormState>();
  TextEditingController smsController = TextEditingController();
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regUserNameController = TextEditingController();
  TextEditingController regPhoneController = TextEditingController();
  TextEditingController regPasswordController = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneAuthFormKey = GlobalKey<FormState>();
  TextEditingController phoneAuthController = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController forgetPasswordEmailController = TextEditingController();

  bool regisPassword = true;
  IconData regSuffix = Icons.visibility_outlined;
  Color regIconColor = Colors.grey;
  bool isLast = false;
  final controller = PageController();
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  Color iconColor = Colors.grey;
  bool checkBoxValue = false;
//===============================================================
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    iconColor = isPassword ? Colors.grey : AppColors.brown;
    emit(LoginChangePasswordVisibilityState());
  }

//===============================================================

  void checkBoxOnChange(bool? value) {
    checkBoxValue = value!;
    emit(ChangeCheckBox());
  }

//===============================================================
  void regChangePasswordVisibility() {
    regisPassword = !regisPassword;
    regSuffix = regisPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    regIconColor = regisPassword ? Colors.grey : AppColors.brown;
    emit(RegisterChangePasswordVisibilityState());
  }

//===============================================================
  void submit() {
    // CacheHelper.saveData(key: onBoarding, value: true).then((value) {
    // });
    MagicRouter.navigateAndPopAll(const LoginScreen());
  }

//===============================================================
  onPageChanged(int index) {
    if (index == boardingData.length - 1) {
      isLast = true;
      emit(OnPageChangedState());
    } else {
      isLast = false;
      emit(OnPageChangedState());
    }
  }

//===============================================================

  Future<void> signIn({required String email, password}) async {
    emit(AuthLoading());
    final res = await signInUseCase.call(SignInParameters(email, password));
    res.fold(
      (l) => {
        emit(SignInFailed(l.message)),
      },
      (r) => {
        GetStorageCacheHelper.cacheUid(uid: r.uid),
        emit(SignInSuccess()),
      },
    );
  }

//===============================================================
  Future<void> signUp({
    required String email,
    password,
    phone,
    userName,
  }) async {
    emit(SignUpLoading());
    final res = await singUpUseCase.call(SignUpParameters(email, password));
    res.fold(
      (l) => {
        emit(SignUpFailed(l.message)),
      },
      (r) => {
        createNewUser(
            email: email, userName: userName, phone: phone, uid: r.uid),
        GetStorageCacheHelper.cacheUid(uid: r.uid),
        emit(SignUpSuccess()),
      },
    );
  }

//===============================================================
  Future<void> googleLogin() async {
    emit(AuthLoading());
    final res = await signInWithGoogleUseCase.call(const NoParameters());
    res.fold(
      (l) => {
        emit(GoogleLoginFailed(l.message)),
      },
      (r) => {
        createNewUser(
          email: r.email!,
          userName: r.displayName ?? "",
          phone: r.phoneNumber ?? "",
          uid: r.uid,
        ),
        GetStorageCacheHelper.cacheUid(uid: r.uid),
        emit(GoogleLoginSuccess()),
      },
    );
  }

//===============================================================
  Future<void> createNewUser({
    required String email,
    phone,
    userName,
    uid,
  }) async {
    emit(CreateNewUserLoading());

    final res = await createNewUserUseCase.call(
      CreateNewUserParameters(
        email: email,
        phone: phone,
        uid: uid,
        userName: userName,
      ),
    );
    res.fold(
        (l) => {
              emit(CreateNewUserFailed(msg: l.message)),
            },
        (r) => {
              emit(CreateNewUserSuccess()),
            });
  }

//===============================================================
  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    emit(VerifyPhoneLoading());
    final res = await verifyPhoneNumberUseCase
        .call(VerifyPhoneNumberParameters(phoneNumber));
    res.fold(
      (l) => {
        emit(VerifyPhoneFailed(msg: l.message)),
      },
      (r) => {
        emit(VerifyPhoneSuccess(phoneNumber)),
      },
    );
  }

//===============================================================
  Future<void> submitSmsCode({required String smsCode}) async {
    emit(PhoneAuthLoading());

    final res =
        await signInWithPhoneUseCase.call(PhoneSignUpParameters(smsCode));
    res.fold(
      (l) => {
        emit(PhoneAuthFailed(msg: l.message)),
      },
      (r) => {
        emit(PhoneAuthSuccess("")),
        createNewUser(
          email: r.user!.email ?? "",
          uid: r.user!.uid,
          phone: r.user!.phoneNumber ?? "",
          userName: r.user!.displayName ?? "",
        ),
      },
    );
  }

//===============================================================
  Future<void> resetPassword({required String email}) async {
    emit(SendEmailForResetPasswordLoading());
    final res = await resetPasswordUseCase.call(ResetPasswordParameters(email));
    res.fold(
      (l) => {
        emit(SendEmailForResetPasswordFailed(msg: l.message)),
      },
      (r) => {
        emit(SendEmailForResetPasswordSuccess()),
      },
    );
  }

//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================
//===============================================================

}
