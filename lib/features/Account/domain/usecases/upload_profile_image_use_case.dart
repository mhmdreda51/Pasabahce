import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error_exceptions/failure.dart';
import '../../../../core/use case/base_use_case.dart';
import '../entities/user.dart';
import '../repositories/base_account_repo.dart';

class UploadProfileImageUseCase
    extends BaseUseCase<void, UploadProfileImageParameters> {
  final BaseAccountRepository baseAccountRepository;

  UploadProfileImageUseCase(this.baseAccountRepository);

  @override
  Future<Either<Failure, void>> call(
      UploadProfileImageParameters parameters) async {
    return await baseAccountRepository.uploadProfileImage(parameters);
  }
}

class UploadProfileImageParameters extends Equatable {
  final File? image;
  UserEntity? userEntity;

  UploadProfileImageParameters({
    required this.image,
    required this.userEntity,
  });

  @override
  List<Object?> get props => [image, userEntity];
}
