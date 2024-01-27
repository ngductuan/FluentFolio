import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/features/topic/presentation/widgets/topic_card.dart';
import 'package:fluentfolio/src/shared/widgets/buttons/elevated_button.dart';
import 'package:fluentfolio/src/shared/widgets/text_fields.dart/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchTopicView extends StatefulWidget {
  const SearchTopicView({super.key});

  static String routeName = '/search_topic_view';

  @override
  State<SearchTopicView> createState() => _SearchTopicViewState();
}

class _SearchTopicViewState extends State<SearchTopicView> {
  final FocusNode _focusNode = FocusNode();
  final bool searchResult = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0.0,
          centerTitle: false,
          titleSpacing: 0.0,
          toolbarHeight: appBarHeightSearchTopic,
          flexibleSpace: SafeArea(
            bottom: false,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: colorsByTheme(context).defaultFont,
                  ),
                  onPressed: () => Navigator.maybePop(context),
                ),
                Expanded(
                  child: SearchTextFieldCustom(
                    focusNode: _focusNode,
                    // controller: _searchController,
                    // hintText: S.current.txtSearchTopicHint,
                    // onSubmitted: (value) => context
                    //     .read<SearchTopicsBloc>()
                    //     .add(SearchTopicsQuerySubmitEvent(
                    //       searchContent: value.trim(),
                    //     )),
                  ),
                ),
                const SizedBox(
                  width: spacing16,
                ),
              ],
            ),
          ),
        ),
        body: Column(children: [
          if (searchResult)
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(children: [
                Text(
                  '${TextDoc.txtFound} 3 ${TextDoc.txtTopicSearch}',
                  style: AppTextStyle(context).getDefaultStyle(),
                ),
              ]),
            ),
          Expanded(
              child: searchResult
                  ? Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacing10),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Container(
                              margin: const EdgeInsets.only(top: spacing16),
                              child: const TopicCard(),
                            );
                          } else {
                            return const TopicCard();
                          }
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: spacing8),
                        itemCount: 9,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: spacing80,
                            width: double.infinity,
                          ),
                          const Icon(
                            Icons.search_off_rounded,
                            size: 64.0,
                            color: AppColor.shadow,
                          ),
                          const SizedBox(
                            height: spacing80,
                            width: double.infinity,
                          ),
                          Text(
                            TextDoc.txtNoResultFound,
                            style: AppTextStyle(context)
                                .getDefaultStyle()
                                .fontSize16,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 38.0,
                          ),
                          SizedBox(
                            width: 271.0,
                            child: Text(
                              '${TextDoc.txtSearchSr}\n\n${TextDoc.txtSearchPlsTryAgain}',
                              style: AppTextStyle(context).getShadowStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 56),
                            child: Text(
                              TextDoc.txtSearchSuggestTopic,
                              style: AppTextStyle(context).getShadowStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: spacing24,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: ElevatedCustom(
                              ontap: () {},
                              title: TextDoc.txtSuggestTopicBtn,
                            ),
                          ),
                          const SizedBox(
                            height: spacing48,
                          ),
                        ],
                      ),
                    ))
        ]));
  }
}
