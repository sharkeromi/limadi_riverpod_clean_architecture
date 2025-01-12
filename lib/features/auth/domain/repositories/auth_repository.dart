import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> registerUser(UserEntity userEntity);
  Future<UserEntity> signInUser(String email, String password);
  Future<void> forgotPassword(String email);
  Future<String> googleLogin();
  Future<String> appleLogin();
}
