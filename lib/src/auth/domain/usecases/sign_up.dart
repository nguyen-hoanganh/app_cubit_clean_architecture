import 'package:app_cubit_clean_architecture/core/usecases/usecases.dart';
import 'package:app_cubit_clean_architecture/core/utils/typedefs.dart';
import 'package:app_cubit_clean_architecture/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

class SignUp extends UseCaseWithParams<void, SignUpParams> {
  const SignUp(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(SignUpParams params) {
    throw UnimplementedError();
  }
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.email,
    required this.password,
    required this.fullName,
  });

  const SignUpParams.empty() : this(email: '', password: '', fullName: '');

  final String email;
  final String password;
  final String fullName;

  @override
  List<Object?> get props => [email, password, fullName];
}
