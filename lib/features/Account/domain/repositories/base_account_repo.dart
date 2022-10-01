import 'package:dartz/dartz.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../entities/user.dart';
import '../usecases/get_user_data_use_case.dart';
import '../usecases/update_profile_use_case.dart';
import '../usecases/upload_profile_image_use_case.dart';

abstract class BaseAccountRepository {
  Future logOut();

  Future<Either<Failure, UserEntity>> getUserData(
    GetUserDataParameters parameters,
  );

  Future<Either<Failure, void>> uploadProfileImage(
    UploadProfileImageParameters parameters,
  );

  Future<Either<Failure, void>> updateProfile(
    UpdateProfileParameters parameters,
  );
}
