import 'package:fluentfolio/src/features/authentication/presentation/views/sign_in_view.dart';
import 'package:fluentfolio/src/features/authentication/presentation/views/sign_up_view.dart';
import 'package:fluentfolio/src/features/general/intro_view.dart';
import 'package:fluentfolio/src/features/general/splash_view.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashView.routeName: (context) => const SplashView(),
  IntroView.routeName: (context) => const IntroView(),
  SignInView.routeName: (context) => const SignInView(),
  SignUpView.routeName: (context) => const SignUpView(),
};
