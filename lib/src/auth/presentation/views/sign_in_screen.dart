import 'package:app_cubit_clean_architecture/core/common/app/providers/user_provider.dart';
import 'package:app_cubit_clean_architecture/core/common/widgets/gradient_background.dart';
import 'package:app_cubit_clean_architecture/core/common/widgets/rounded_button.dart';
import 'package:app_cubit_clean_architecture/core/res/fonts.dart';
import 'package:app_cubit_clean_architecture/core/res/media_res.dart';
import 'package:app_cubit_clean_architecture/core/utils/core_utils.dart';
import 'package:app_cubit_clean_architecture/src/auth/data/models/user_model.dart';
import 'package:app_cubit_clean_architecture/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_cubit_clean_architecture/src/auth/presentation/widgets/sign_in_form.dart';
import 'package:app_cubit_clean_architecture/src/dashboard/presentation/views/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const routeName = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            CoreUtils.showSnackBar(context, state.message);
          } else if (state is SignedIn) {
            context.read<UserProvider>().initUser(state.user as LocalUserModel);
            Navigator.pushReplacementNamed(context, Dashboard.routeName);
          }
        },
        builder: (context, state) {
          return GradientBackground(
            image: MediaRes.authGradientBackground,
            child: SafeArea(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.s,
                  ),
                  children: [
                    Text(
                      'Easy to learn, discover more skills.',
                      style: TextStyle(
                        fontFamily: Fonts.aeonik,
                        fontWeight: FontWeight.w700,
                        fontSize: 32.s,
                      ),
                    ),
                    SizedBox(
                      height: 10.s,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign in to your account',
                          style: TextStyle(fontSize: 14.s),
                        ),
                        Baseline(
                          baseline: 100,
                          baselineType: TextBaseline.alphabetic,
                          child: TextButton(
                            onPressed: () => Navigator.pushReplacementNamed(
                              context,
                              SignInScreen.routeName,
                            ),
                            child: const Text('Register account?'),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.s,
                    ),
                    SignInForm(
                      emailController: emailController,
                      passwordController: passwordController,
                      formKey: formKey,
                    ),
                    SizedBox(
                      height: 20.s,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/forgot-password '),
                        child: const Text('Forgot password?'),
                      ),
                    ),
                    if (state is AuthLoading)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    else
                      RoundedButton(
                        label: 'Sign In',
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          FirebaseAuth.instance.currentUser?.reload();
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  SignInEvent(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                          }
                        },
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
