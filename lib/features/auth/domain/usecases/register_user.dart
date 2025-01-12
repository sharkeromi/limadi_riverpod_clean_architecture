import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/user_entity.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<UserEntity> call(UserEntity userData) async{
    var test =  await repository.registerUser(userData);
    test.name = "";
    return test;
  }
}
