import 'package:app_cubit_clean_architecture/core/utils/typedefs.dart';

abstract class UserCaseWithParams<Type, Params> {
  const UserCaseWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UserCaseWithoutParams<Type> {
  const UserCaseWithoutParams();

  ResultFuture<Type> call();
}
