

import 'package:limadi_riverpod_clean_architecture/features/auth/data/model/user_model.dart';

class AuthRemoteDataSource {

  Future<UserModel> registerUsers( UserModel userData) async {
    // Call API to register user
    // Example:
    // final response = await http.post(Uri.parse('https://api.example.com/register'), body: userData);
    return UserModel(id: 1, name: "dwe", email: "email", phone: "aasd");
  }


  Future<UserModel> signInUser(String email, String password) async {
    // Call API to sign in user
    return UserModel(id: 1, name: "dwe", email: "email", phone: "aasd"); // Return mock token
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
