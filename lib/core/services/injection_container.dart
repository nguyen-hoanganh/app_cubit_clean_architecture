import 'package:app_cubit_clean_architecture/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:app_cubit_clean_architecture/src/auth/data/repos/auth_repo_impl.dart';
import 'package:app_cubit_clean_architecture/src/auth/domain/repos/auth_repo.dart';
import 'package:app_cubit_clean_architecture/src/auth/domain/usecases/forgot_password.dart';
import 'package:app_cubit_clean_architecture/src/auth/domain/usecases/sign_in.dart';
import 'package:app_cubit_clean_architecture/src/auth/domain/usecases/sign_up.dart';
import 'package:app_cubit_clean_architecture/src/auth/domain/usecases/update_user.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/data/repos/on_boarding_repo_impl.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/datasources/on_boarding_local_data_source.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/domain/repos/onboarding_repo.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'injection_container.main.dart';
