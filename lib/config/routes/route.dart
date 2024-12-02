import 'package:ecommerce_app/features/app/presentation/pages/app_page.dart';
import 'package:ecommerce_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:ecommerce_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:ecommerce_app/features/home/presentation/pages/home_page.dart';
import 'package:ecommerce_app/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app_routes.dart';

class RoutesGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) {
          if (Supabase.instance.client.auth.currentUser != null) {
            return const AppPage();
          } else {
            return const OnboardingPage();
          }
        });
      case AppRoutes.signIn:
        return MaterialPageRoute(builder: (context) {
          return const SignInPage();
        });
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return onUnknownRoute(settings);
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
