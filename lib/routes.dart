import 'package:fluentfolio/src/features/authentication/presentation/views/reset_password.dart';
import 'package:fluentfolio/src/features/authentication/presentation/views/sign_in_view.dart';
import 'package:fluentfolio/src/features/authentication/presentation/views/sign_up_view.dart';
import 'package:fluentfolio/src/features/general/intro_view.dart';
import 'package:fluentfolio/src/features/general/splash_view.dart';
import 'package:fluentfolio/src/features/home/presentation/views/home_view.dart';
import 'package:fluentfolio/src/features/search_topic/presentation/views/search_topic_view.dart';
import 'package:fluentfolio/src/features/topic/presentation/views/select_topic_view.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  // Introduction
  SplashView.routeName: (context) => const SplashView(),
  IntroView.routeName: (context) => const IntroView(),

  // Authentication
  SignInView.routeName: (context) => const SignInView(),
  SignUpView.routeName: (context) => const SignUpView(),
  ResetPasswordView.routeName: (context) => const ResetPasswordView(),

  // Home
  HomeView.routeName: (context) => const HomeView(),

  // Topic
  SelectTopicView.routeName: (context) => const SelectTopicView(),
  SearchTopicView.routeName: (context) => const SearchTopicView(),
};
