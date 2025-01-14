import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:limadi_riverpod_clean_architecture/core/network/network_service.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/common_model/common_data_model.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/common_model/error_model.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/const.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/functions.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/urls.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/data/model/login_response.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/sign_in_entity.dart';

class AuthRemoteDataSource {
  ApiController apiController = ApiController();

  // Future<UserModel> registerUsers(UserModel userData) async {
  //   // Call API to register user
  //   // Example:
  //   // final response = await http.post(Uri.parse('https://api.example.com/register'), body: userData);
  //   // return UserModel();
  // }

  Future<Either<ErrorModel, LoginModel>> signInUser(SignInEntity signInEntity) async {
    try {
      Map<String, dynamic> body = {
        'email': signInEntity.email.toString(),
        "password": signInEntity.password.toString(),
      };
      log("body : $body");
      var response = await apiController.commonApiCall(
        url: kuLogin,
        body: body,
        requestMethod: kPost,
      ) as CommonDM;

      if (response.success == true) {
        LoginModel loginData = LoginModel.fromJson(response.data);
        showToaster("Success");
        return right(loginData);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        showToaster(errorModel.errors[0].message);
        return left(errorModel);
      }
    } catch (e) {
      log('userLogin error: $e');
      showToaster("Error");
      return left(exceptionCatcher(e));
    }
  }

  Future<void> forgotPassword(String email) async {
    // Call API to initiate forgot password
  }

  Future<String> googleLogin() async {
    // Call API for Google login or integrate Firebase
    return "token";
  }

  Future<String> appleLogin() async {
    // Call API for Apple login
    return "token";
  }
}
