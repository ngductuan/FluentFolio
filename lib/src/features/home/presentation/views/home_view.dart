import 'package:fluentfolio/src/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static String routeName = '/home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final tabs = [
    Container(
      child: const Center(child: Text('Topic')),
    ),
    Container(
      child: const Center(child: Text('Favorite')),
    ),
    Container(
      child: const Center(child: Text('Account')),
    ),
    Container(
      child: const Center(child: Text('Setting')),
    ),
  ];

  void onTabChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: SafeArea(
        child: tabs[_currentIndex],
      ),
      bottomNavigationBar: AppBottomNavBar(onTabChanged: onTabChanged),
    );
  }
}
