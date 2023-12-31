import 'package:app_cubit_clean_architecture/core/common/app/providers/user_provider.dart';
import 'package:app_cubit_clean_architecture/core/res/colours.dart';
import 'package:app_cubit_clean_architecture/core/res/fonts.dart';
import 'package:app_cubit_clean_architecture/core/services/injection_container.dart';
import 'package:app_cubit_clean_architecture/core/services/router.dart';
import 'package:app_cubit_clean_architecture/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'HA Education',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
          ),
          fontFamily: Fonts.poppins,
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
