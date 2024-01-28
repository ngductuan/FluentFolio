import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/features/topic/presentation/views/elementary_topic_view.dart';
import 'package:fluentfolio/src/features/topic/presentation/views/intermediate_topic_view.dart';
import 'package:fluentfolio/src/features/topic/presentation/views/pre_intermediate_topic_view.dart';
import 'package:fluentfolio/src/features/topic/presentation/views/upper_intermediate_topic_view.dart';
import 'package:fluentfolio/src/shared/widgets/app_bar/app_bar_custom.dart';
import 'package:fluentfolio/src/shared/widgets/bottom_app_bar/bottom_app_bar.dart';
import 'package:flutter/material.dart';

class SelectTopicView extends StatefulWidget {
  SelectTopicView({super.key});

  static String routeName = '/select_topic_view';
  final List tabNames = [
    TextDoc.txtElementary,
    TextDoc.txtPreIntermediate,
    TextDoc.txtIntermediate,
    TextDoc.txtUpperIntermediate,
  ];

  @override
  State<SelectTopicView> createState() => _SelectTopicViewState();
}

class _SelectTopicViewState extends State<SelectTopicView>
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
    // Dispose tab bar
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        bottomAppbar: BottomAppBarCustom(
          tabController: _tabController,
          tabNames: widget.tabNames,
        ).buildTabBar(context),
        appBarHeight: appBarHeightAndBottomGlobal,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ElementaryTopicView(),
          PreIntermediateTopicView(),
          IntermediateTopicView(),
          UpperIntermediateTopicView(),
        ],
      ),
    );
  }
}
