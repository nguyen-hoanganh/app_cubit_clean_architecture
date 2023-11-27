import 'package:app_cubit_clean_architecture/src/on_boarding/data/repos/on_boarding_repo_impl.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/datasources/on_boarding_local_data_source.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/domain/repos/onboarding_repo.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = SharedPreferences.getInstance();
  sl
    ..registerFactory(
      () => OnBoardingCubit(
        cachingFirstTimer: sl(),
        checkIfUserIsFirstTimer: sl(),
      ),
    )
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))
    ..registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(sl()))
    ..registerLazySingleton<OnBoardingLocalDataSource>(
        () => OnBoardingLocalDataSrcImpl(sl()))
    ..registerLazySingleton(() => prefs);
}
