import 'package:fluentfolio/src/features/accounts/presentation/views/sign_in_screen.dart';
import 'package:fluentfolio/src/features/general/intro_screen.dart';
import 'package:fluentfolio/src/features/general/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
};
