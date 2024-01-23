import 'package:fluentfolio/src/constants/colors.dart';
import 'package:fluentfolio/src/constants/dimensions.dart';
import 'package:fluentfolio/src/constants/theme.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:flutter/material.dart';

class AppBottomNavBar extends StatefulWidget {
  final void Function(int) onTabChanged;

  const AppBottomNavBar({super.key, required this.onTabChanged});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int _currentIndex = 0;

  BottomNavigationBarItem _bottomNavItem(
      String label, String icoBefore, String icoAfter) {
    return BottomNavigationBarItem(
      icon: ImageHelper.loadFromAsset(
        icoBefore,
        width: iconBottomNav24,
        height: iconBottomNav24,
      ),
      activeIcon: ImageHelper.loadFromAsset(
        icoAfter,
        width: iconBottomNav24,
        height: iconBottomNav24,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: colorsByTheme(context).hintTextColor ?? Colors.black,
            blurRadius: isDarkThemeHold ? 5 : 2,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 30,
        // selected label
        fixedColor: AppColor.mainColor1,
        type: BottomNavigationBarType.fixed,
        // unselected label
        unselectedItemColor: colorsByTheme(context).defaultFont,
        unselectedFontSize: 12,
        selectedFontSize: 14,
        backgroundColor: colorsByTheme(context).backgroundTheme,
        onTap: (index) {
          // Update the index when a bottom navigation item is tapped.
          _currentIndex = index;
          widget.onTabChanged(_currentIndex);
        },
        items: [
          _bottomNavItem('Topic', AssetHelper.icoDashboard,
              AssetHelper.icoFilledDashboard),
          _bottomNavItem('Favorite', AssetHelper.icoFavorite,
              AssetHelper.icoFilledFavorite),
          _bottomNavItem(
              'Account', AssetHelper.icoAccount, AssetHelper.icoFilledAccount),
          _bottomNavItem(
              'Setting', AssetHelper.icoSetting, AssetHelper.icoFilledSetting),
        ],
      ),
    );
  }
}
