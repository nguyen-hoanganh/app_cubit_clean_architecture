import 'package:app_cubit_clean_architecture/core/res/colours.dart';
import 'package:app_cubit_clean_architecture/core/res/fonts.dart';
import 'package:app_cubit_clean_architecture/core/services/injection_container.dart';
import 'package:app_cubit_clean_architecture/core/services/route.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HA Education',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
        fontFamily: Fonts.poppins,
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
