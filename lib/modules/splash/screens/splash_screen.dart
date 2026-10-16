import 'package:flutter/material.dart';
import 'package:news/core/routes/app_routes.dart';
import 'package:news/core/theme/app_assets.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BackInDown(
                duration: Duration(seconds: 2),
                child: Image.asset(AppAssets.splashScreenImage),
              ),
            ),
            FadeInUp(
              delay: Duration(seconds: 2),
              duration: Duration(seconds: 2),
              onFinish: (direction) {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.homeRouteName,
                );
              },
              child: Image.asset(
                AppAssets.brandingLogo,
                width: 214,
                height: 88,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
