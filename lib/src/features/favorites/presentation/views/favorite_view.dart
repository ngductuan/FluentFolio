import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/features/favorite_topics/presentation/views/favorite_topics_view.dart';
import 'package:fluentfolio/src/features/vocabularies/presentation/views/vocabs_view.dart';
import 'package:fluentfolio/src/shared/widgets/app_bar/app_bar_custom.dart';
import 'package:fluentfolio/src/shared/widgets/bottom_app_bar/bottom_app_bar.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatefulWidget {
  FavoriteView({super.key});

  static String routeName = '/favorite_view';
  final List tabNames = [
    TextDoc.txtTopicsTab,
    TextDoc.txtVocabsTab,
  ];

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int tabIndex = 0;
  late final int maxPage;

  @override
  void initState() {
    super.initState();
    // Specify maxPage
    maxPage = widget.tabNames.length;
    // Initialize TabController
    _tabController = TabController(
      length: maxPage,
      vsync: this,
      initialIndex: tabIndex,
    );
    // Listen events
    _tabController.addListener(() {
      setState(() {
        tabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        isReminder: false,
        isSearch: false,
        bottomAppbar: BottomAppBarCustom(
          tabController: _tabController,
          tabNames: widget.tabNames,
        ).buildTabBar(context),
        appBarHeight: appBarHeightAndBottomGlobal,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          FavoriteTopicsView(),
          VocabsView(),
        ],
      ),
    );
  }
}
