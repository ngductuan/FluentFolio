import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/features/topic/presentation/widgets/select_topic_app_bar.dart';
import 'package:flutter/material.dart';

class SelectTopicView extends StatefulWidget {
  const SelectTopicView({super.key});

  @override
  State<SelectTopicView> createState() => _SelectTopicViewState();
}

class _SelectTopicViewState extends State<SelectTopicView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int tabIndex = 0;
  int maxPage = 4;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: maxPage,
      vsync: this,
      initialIndex: tabIndex,
    );
    _tabController.addListener(() {
      // Handle tab changes here
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
      appBar: SelectTopicAppBar(
        tabController: _tabController,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text(
            "It's cloudy here 1",
            style: AppTextStyle(context).getDefaultStyle(),
          ),
          Text(
            "It's rainy here 2",
            style: AppTextStyle(context).getDefaultStyle(),
          ),
          Text(
            "It's sunny here 3",
            style: AppTextStyle(context).getDefaultStyle(),
          ),
          Text(
            "It's sunny here 4",
            style: AppTextStyle(context).getDefaultStyle(),
          ),
        ],
      ),
    );
  }
}
