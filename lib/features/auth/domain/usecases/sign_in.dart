import 'package:dartz/dartz.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/common_model/error_model.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/sign_in_entity.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/user_entity.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/repositories/auth_repository.dart';

class UserSignIn {
  final AuthRepository repository;

  UserSignIn(this.repository);

  Future<Either<ErrorModel, UserEntity>> call(SignInEntity signInEntity) async{
    final Either<ErrorModel, UserEntity> response =  await repository.signInUser(signInEntity);
    return response.fold((l){
      return left(l);
    }, (r){
      return right(r);
    });

  }
}