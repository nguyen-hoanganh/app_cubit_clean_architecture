import 'package:app_cubit_clean_architecture/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Center(
        child: Text(
          'sign in screen'.toUpperCase(),
          style: context.theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
