import 'package:flutter/material.dart';
import 'package:marveldex/core/application.dart';
import 'package:marveldex/core/styles/colors.dart';
import 'package:marveldex/ui/pages/splash/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Application.setup();

  runApp(const MarvelDexApp());
}

class MarvelDexApp extends StatelessWidget {
  const MarvelDexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarvelDex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.midRed),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
