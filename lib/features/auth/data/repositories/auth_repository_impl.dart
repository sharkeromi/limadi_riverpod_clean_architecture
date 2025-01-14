import 'package:dartz/dartz.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/common_model/error_model.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/sign_in_entity.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/user_entity.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  // @override
  // Future<UserEntity> registerUser(userData) async {
  //   final user = UserModel.fromEntity(userData);
  //   UserModel registeredUser = await remoteDataSource.registerUsers(user);
  //   return registeredUser.toEntity();
  // }

  @override
  Future<Either<ErrorModel, UserEntity>> signInUser(SignInEntity signInEntity) async {
    final res = await remoteDataSource.signInUser(signInEntity);
    return res.fold((l) {
      return left(l);
    }, (r) {
      return right(r.user.toEntity());
    });
  }

  @override
  Future<void> forgotPassword(String email) {
    return remoteDataSource.forgotPassword(email);
  }

  @override
  Future<String> googleLogin() {
    return remoteDataSource.googleLogin();
  }

  @override
  Future<String> appleLogin() {
    return remoteDataSource.appleLogin();
  }
}
