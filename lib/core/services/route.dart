import 'package:app_cubit_clean_architecture/core/common/views/page_under_construction.dart';
import 'package:app_cubit_clean_architecture/core/services/injection_container.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:app_cubit_clean_architecture/src/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingScreen.routeName:
      return _pageRouteBuilder(
        (p0) => BlocProvider(
          create: (BuildContext context) => sl<OnBoardingCubit>(),
          child: const OnBoardingScreen(),
        ),
        settings: settings,
      );
    default:
      return _pageRouteBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageRouteBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
