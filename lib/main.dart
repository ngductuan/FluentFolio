import 'package:fluentfolio/routes.dart';
import 'package:fluentfolio/src/constants/theme.dart';
import 'package:fluentfolio/src/features/authentication/presentation/views/reset_password.dart';
import 'package:fluentfolio/src/features/authentication/presentation/views/sign_in_view.dart';
import 'package:fluentfolio/src/features/authentication/presentation/views/sign_up_view.dart';
import 'package:fluentfolio/src/features/home/presentation/views/home_view.dart';
import 'package:fluentfolio/src/helpers/local_storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  // Local storage
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: getThemeData(context, isDarkTheme: false),
        debugShowCheckedModeBanner: false,
        routes: routes,
        home: const HomeView());
  }
}
