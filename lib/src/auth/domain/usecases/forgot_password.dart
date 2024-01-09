import 'package:app_cubit_clean_architecture/core/usecases/usecases.dart';
import 'package:app_cubit_clean_architecture/core/utils/typedefs.dart';
import 'package:app_cubit_clean_architecture/src/auth/domain/repos/auth_repo.dart';

class ForgotPasswords extends UseCaseWithParams<void, String> {
  const ForgotPasswords(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params);
}
