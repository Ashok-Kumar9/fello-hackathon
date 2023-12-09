import 'package:fello/Routes/routes.dart';
import 'package:fello/utils/constants/assets.dart';
import 'package:fello/utils/shared_pref/shared_prefs.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (SharedPrefs().isLogin) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.popAndPushNamed(context, AppRoutes.navigationBar);
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.popAndPushNamed(context, AppRoutes.onboarding);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // add zoom out animation for 2 seconds to show the image
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.logo,
          width: 200,
        ),
      )
    );
  }
}
