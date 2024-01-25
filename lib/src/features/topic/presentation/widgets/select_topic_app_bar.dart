import 'package:fluentfolio/src/shared/widgets/tab_indicator/tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluentfolio/src/constants/styles.dart';

class SelectTopicAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SelectTopicAppBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<SelectTopicAppBar> createState() => _SelectTopicAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}

class _SelectTopicAppBarState extends State<SelectTopicAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorsByTheme(context).backgroundTheme,
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: appBarHeight,
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: spacing8,
          ),
          Text(TextDoc.txtFluentFolioTitle),
        ],
      ),
      titleTextStyle: AppTextStyle(context).getDefaultStyle().fontLeading1.bold,
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.lightbulb_outline_rounded,
            color: AppColor.mainColor1,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.search_rounded,
            color: AppColor.mainColor1,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: AppColor.mainColor1,
          ),
          onPressed: () {},
        ),
      ],
      bottom: TabBar(
          indicator: LineTabIndicator(
            color: AppColor.secondary,
            height: spacing2,
          ),
          indicatorColor: AppColor.secondary,
          labelColor: AppColor.secondary,
          unselectedLabelColor: colorsByTheme(context).tabTitleColor,
          controller: widget.tabController,
          isScrollable: true,
          tabs: [
            Tab(
              child: Text(TextDoc.txtElementary,
                  style: AppTextStyle(context).getDefaultStyle()),
            ),
            Tab(
              child: Text(
                TextDoc.txtPreIntermediate,
                style: AppTextStyle(context).getDefaultStyle(),
              ),
            ),
            Tab(
              child: Text(
                TextDoc.txtIntermediate,
                style: AppTextStyle(context).getDefaultStyle(),
              ),
            ),
            Tab(
              child: Text(
                TextDoc.txtUpperIntermediate,
                style: AppTextStyle(context).getDefaultStyle(),
              ),
            ),
          ]),
    );
  }
}
