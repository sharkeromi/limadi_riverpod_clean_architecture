import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:limadi_riverpod_clean_architecture/config/theme/colors.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/functions.dart';
import 'package:limadi_riverpod_clean_architecture/core/widgets/custom_loading.dart';
import 'package:limadi_riverpod_clean_architecture/features/auth/presentation/providers/auth_providers.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    heightWidthKeyboardValue(context);
    final userState = ref.watch(authNotifierProvider);
    final userNotifier = ref.read(authNotifierProvider.notifier);

    return Stack(
      children: [
        Container(
          color: cWhiteColor,
          child: SafeArea(
            top: false,
            child: Scaffold(
              appBar: AppBar(title: Text('Login')),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: userNotifier.emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    TextField(
                      controller: userNotifier.passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    // if (userState!.error != null)
                    //   Text(
                    //     userState.error!,
                    //     style: TextStyle(color: Colors.red),
                    //   ),
                    ElevatedButton(
                      onPressed: () async {
                        await userNotifier.signIn(context);
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (userState!.isLoading)
          Positioned(
            child: CommonLoadingAnimation(
              onWillPop: () async {
                if (userState.isLoading) {
                  return false;
                }
                return true;
              },
            ),
          ),
      ],
    );
  }
}
