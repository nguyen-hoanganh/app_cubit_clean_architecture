import 'package:app_cubit_clean_architecture/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Center(
        child: Text(
          'dashboard'.toUpperCase(),
          style: context.theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
