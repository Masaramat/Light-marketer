import 'package:flutter/material.dart';
import 'package:mvvm/util/routes/route_name.dart';
import 'package:mvvm/view/home_view.dart';
import 'package:mvvm/view/loan_view.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/signup_view.dart';
import 'package:mvvm/view/splash_view.dart';

import '../../view/main_view.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePageView());
      case RoutesName.main:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MainView());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());
      case RoutesName.loan:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoanApplication());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("No route found")),
          );
        });
    }
  }
}
