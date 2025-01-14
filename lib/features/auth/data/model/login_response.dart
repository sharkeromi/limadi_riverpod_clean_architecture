import 'package:limadi_riverpod_clean_architecture/features/auth/data/model/user_model.dart';

class LoginModel {
  UserModel user;
  dynamic token;

  LoginModel({
    required this.user,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: UserModel.fromJson(json["user"]),
        token: json["token"],
      );
}