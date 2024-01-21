import 'package:fluentfolio/src/features/authentication/presentation/views/sign_in_view.dart';
import 'package:fluentfolio/src/features/general/intro_view.dart';
import 'package:fluentfolio/src/features/general/splash_view.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
};
