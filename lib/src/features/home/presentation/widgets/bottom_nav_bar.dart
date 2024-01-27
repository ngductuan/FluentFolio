import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:fluentfolio/src/shared/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class AppBottomNavBar extends StatefulWidget {
  final void Function(int) onTabChanged;

  const AppBottomNavBar({super.key, required this.onTabChanged});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  BottomNavigationBarItem _bottomNavItem(
      String label, String icoBefore, String icoAfter) {
    return BottomNavigationBarItem(
        icon: ImageHelper.loadFromAsset(
          icoBefore,
          width: iconBottomNav26,
          height: iconBottomNav26,
        ),
        activeIcon: ImageHelper.loadFromAsset(
          icoAfter,
          width: iconBottomNav26,
          height: iconBottomNav26,
        ),
        label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Platform.isAndroid ? bottomNavHeightAndroid : bottomNavHeightIOS,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // color: colorsByTheme(context).hintTextColor ?? Colors.black,
            color: AppColor.shadow.shade500,
            blurRadius: isDarkThemeHold ? 5 : 2,
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, // Remove splash color
          highlightColor: Colors.transparent, // Remove highlight color
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          elevation: 30,
          // selected label
          fixedColor: AppColor.mainColor1,
          type: BottomNavigationBarType.fixed,
          // unselected label
          unselectedItemColor: AppColor.shadow,
          unselectedFontSize: fontSize12,
          selectedFontSize: fontSize14,
          backgroundColor: colorsByTheme(context).backgroundTheme,
          // selectedItemColor: Colors.red,
          // selectedItemColor: const Color(0xFF42A5F5),
          onTap: (index) {
            // Update the index when a bottom navigation item is tapped.
            _currentIndex = index;
            widget.onTabChanged(_currentIndex);
            // AppToast(
            //   context: context,
            //   message: TextDoc.txtAddFavoriteSuccess,
            //   mode: AppToastMode.warning,
            // ).show(context);
          },
          items: [
            _bottomNavItem('Topic', AssetHelper.icoDashboard,
                AssetHelper.icoFilledDashboard),
            _bottomNavItem('Favorite', AssetHelper.icoFavorite,
                AssetHelper.icoFilledFavorite),
            _bottomNavItem('Account', AssetHelper.icoAccount,
                AssetHelper.icoFilledAccount),
            _bottomNavItem('Setting', AssetHelper.icoSetting,
                AssetHelper.icoFilledSetting),
          ],
        ),
      ),
    );
  }
}
