import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news/core/routes/app_routes.dart';
import 'package:news/modules/layout/view/screens/home_screen.dart';
import 'package:news/modules/splash/screens/splash_screen.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashRouteName,
      routes: {
        AppRoutes.splashRouteName: (context) => const SplashScreen(),
        AppRoutes.homeRouteName: (context) =>  HomeScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}