import 'package:app_cubit_clean_architecture/core/errors/exceptions.dart';
import 'package:app_cubit_clean_architecture/core/errors/failures.dart';
import 'package:app_cubit_clean_architecture/core/utils/typedefs.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/datasources/on_boarding_local_data_source.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/domain/repos/onboarding_repo.dart';
import 'package:dartz/dartz.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  const OnBoardingRepoImpl(this._localDataSource);

  final OnBoardingLocalDataSource _localDataSource;

  @override
  ResultFuture<void> cacheFirstTimer() async {
    try {
      await _localDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() async {
    try {
      final result = await _localDataSource.checkIfUserIsFirstTimer();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
