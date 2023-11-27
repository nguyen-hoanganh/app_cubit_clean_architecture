import 'package:app_cubit_clean_architecture/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit({
    required CacheFirstTimer cachingFirstTimer,
    required CheckIfUserIsFirstTimer checkIfUserIsFirstTimer,
  })  : _cachingFirstTimer = cachingFirstTimer,
        _checkIfUserIsFirstTimer = checkIfUserIsFirstTimer,
        super(const OnBoardingInitial());

  final CacheFirstTimer _cachingFirstTimer;
  final CheckIfUserIsFirstTimer _checkIfUserIsFirstTimer;

  Future<void> cacheFirstTimer() async {
    final result = await _cachingFirstTimer();

    result.fold(
      (failure) => emit(OnBoardingError(message: failure.errorMessage)),
      (r) => emit(const UserCached()),
    );
  }

  Future<void> checkIfUserIsFirstTimer() async {
    final result = await _checkIfUserIsFirstTimer();

    result.fold(
      (l) => emit(const OnBoardingStatus(isFirstTimer: true)),
      (status) => emit(
        OnBoardingStatus(isFirstTimer: status),
      ),
    );
  }
}
