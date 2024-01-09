import 'dart:async';
import 'dart:io';

import 'package:app_cubit_clean_architecture/core/enums/update_user.dart';
import 'package:app_cubit_clean_architecture/src/auth/domain/entities/user.dart';
import 'package:app_cubit_clean_architecture/src/auth/domain/usecases/forgot_password.dart';
import 'package:app_cubit_clean_architecture/src/auth/domain/usecases/sign_in.dart';
import 'package:app_cubit_clean_architecture/src/auth/domain/usecases/sign_up.dart';
import 'package:app_cubit_clean_architecture/src/auth/domain/usecases/update_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignIn signIn,
    required SignUp signUp,
    required ForgotPasswords forgotPassword,
    required UpdateUser updateUser,
  })  : _signIn = signIn,
        _signUp = signUp,
        _forgotPassword = forgotPassword,
        _updateUser = updateUser,
        super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(const AuthLoading());
    });
    on<SignInEvent>(_signInHandler);
  }

  final SignIn _signIn;
  final SignUp _signUp;
  final ForgotPasswords _forgotPassword;
  final UpdateUser _updateUser;

  Future<void> _signInHandler(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signIn(
      SignInParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(SignedIn(user)),
    );
  }
}
