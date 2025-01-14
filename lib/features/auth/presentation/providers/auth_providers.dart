import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/sign_in_entity.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/user_entity.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/repositories/auth_repository.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/domain/usecases/sign_in.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/presentation/providers/auth_state.dart';
import 'package:limadi_riverpod_clean_architecture/features/home/presentation/homePage.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.read(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
});

final userSignInProvider = Provider<UserSignIn>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return UserSignIn(repository);
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState?>((ref) {
  final getTrips = ref.read(userSignInProvider);

  return AuthNotifier(getTrips, ref);
});

final userEntityProvider = StateProvider<UserEntity?>((ref) => null);

class AuthNotifier extends StateNotifier<AuthState?> {
  final UserSignIn _userSignIn;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Ref ref;

  AuthNotifier(this._userSignIn, this.ref) : super(AuthState());

  Future<void> signIn(context) async {
    final signInEntity = SignInEntity(email: emailController.text, password: passwordController.text);
    state = state?.copyWith(isLoading: true, error: null);
    final response = await _userSignIn.call(signInEntity);

    response.fold((failure) {
      state = state!.copyWith(isLoading: false, error: failure.errors[0].message, user: null);
    }, (user) {
      state = state!.copyWith(isLoading: false, error: null, user: user);
      ref.read(userEntityProvider.notifier).state = user;
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }
}
