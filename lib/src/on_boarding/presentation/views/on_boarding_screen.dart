import 'package:app_cubit_clean_architecture/core/common/views/loading_view.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const routeName = '/';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OnBoardingCubit>().checkIfUserIsFirstTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          if (state is OnBoardingState) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is UserCached) {
            //todo something
          }
        },
        builder: (context, state) {
          if (state is CheckingIfUserIsFirstTimer || state is CacheFirstTimer) {
            return const LoadingView();
          }
          return Container();
        },
      ),
    );
  }
}
