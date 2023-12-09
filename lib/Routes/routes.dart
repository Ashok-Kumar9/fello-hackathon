import 'package:fello/screens/explore/add_goal.dart';
import 'package:fello/screens/explore/explore.dart';
import 'package:fello/screens/home/home.dart';
import 'package:fello/screens/login/login_screen.dart';
import 'package:fello/screens/navbar/navbar_screen.dart';
import 'package:fello/screens/onboarding/onboarding.dart';
import 'package:fello/screens/profile/profile.dart';
import 'package:fello/screens/refer/refer.dart';
import 'package:fello/screens/splash/splash_screen.dart';
import 'package:fello/screens/track/track.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String navigationBar = '/navigationBar';
  static const String home = '/home';
  static const String explore = '/explore';
  static const String track = '/track';
  static const String profile = '/profile';
  static const String refer = '/refer';
  static const String addGoal = '/addGoal';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case navigationBar:
        return MaterialPageRoute(builder: (_) => const NavbarScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case explore:
        return MaterialPageRoute(builder: (_) => const ExploreScreen());
      case track:
        return MaterialPageRoute(builder: (_) => const TrackScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case refer:
        return MaterialPageRoute(builder: (_) => const ReferScreen());
      case addGoal:
        return MaterialPageRoute(builder: (_) => const AddGoalScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
