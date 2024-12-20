import 'package:fluentfolio/src/features/authentication/presentation/views/sign_in_view.dart';
import 'package:fluentfolio/src/features/general/intro_view.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:fluentfolio/src/helpers/local_storage_helper.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static String routeName = '/splash_screen';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void _routeIntroScr(BuildContext context) async {
    final ignoreSplash = LocalStorageHelper.getValue('ignoreSplash') as bool?;
    await Future.delayed(const Duration(milliseconds: 2000));

    if (ignoreSplash != null && ignoreSplash) {
      if (context.mounted) {
        Navigator.pushNamed(context, SignInView.routeName);
      }
    } else {
      LocalStorageHelper.setValue('ignoreSplash', true);
      if (context.mounted) {
        Navigator.pushNamed(context, IntroView.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _routeIntroScr(context);

    return Scaffold(
      body: ImageHelper.loadFromAsset(
        AssetHelper.logoBackgroundSplash,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
