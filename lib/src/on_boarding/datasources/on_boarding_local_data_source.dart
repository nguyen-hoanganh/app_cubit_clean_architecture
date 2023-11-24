import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSource {
  const OnBoardingLocalDataSource();

  Future<void> cacheFirstTimer();

  Future<void> checkIfUserIsFirstTimer();
}

const kFirstTimerKey = 'first_timer';

class OnBoardingLocalDataSrcImpl extends OnBoardingLocalDataSource {
  const OnBoardingLocalDataSrcImpl(this._pref);

  final SharedPreferences _pref;

  @override
  Future<void> cacheFirstTimer() {
    throw UnimplementedError();
  }

  @override
  Future<void> checkIfUserIsFirstTimer() {
    throw UnimplementedError();
  }
}
