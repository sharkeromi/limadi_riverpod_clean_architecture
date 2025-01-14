import 'package:dartz/dartz.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/common_model/error_model.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/sign_in_entity.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  // Future<UserEntity> registerUser(UserEntity userEntity);
  Future<Either<ErrorModel,UserEntity>> signInUser(SignInEntity signInEntity);
  Future<void> forgotPassword(String email);
  Future<String> googleLogin();
  Future<String> appleLogin();
}
