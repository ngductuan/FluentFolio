import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/features/topic_details/presentation/widgets/phrase_card.dart';
import 'package:fluentfolio/src/features/topic_details/presentation/widgets/question_card.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:flutter/material.dart';

class TopicDetailsView extends StatefulWidget {
  const TopicDetailsView({super.key});

  static String routeName = '/topic_details_view';

  @override
  State<TopicDetailsView> createState() => _TopicDetailsViewState();
}

class _TopicDetailsViewState extends State<TopicDetailsView> {
  late final ScrollController _scrollController;

  bool _showTitle = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 100 && !_showTitle) {
      setState(() {
        _showTitle = true;
      });
      // print('loai 1');
    } else if (_scrollController.offset < 100 && _showTitle) {
      setState(() {
        _showTitle = false;
      });
      // print('loai 2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar.medium(
            leading: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Icon(
                Icons.arrow_back,
                color: colorsByTheme(context).defaultFont,
              ),
            ),
            expandedHeight: 160.0,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title: _showTitle
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: Text('Solutions to Climate Change',
                            style: AppTextStyle(context)
                                .getDefaultStyle()
                                .fontSize16, // Adjust font size as needed
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                    )
                  : null,
              background: Container(
                // No need to fix
                height: 144.0 + MediaQuery.of(context).padding.top,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const NetworkImage(TempNote.imgTopicUrl),
                    fit: BoxFit.cover,
                    onError: (_, __) => SizedBox(
                      width: double.infinity,
                      height: 144 + MediaQuery.of(context).padding.top,
                      child: const Icon(
                        Icons.error_outline_rounded,
                        size: 40,
                        color: AppColor.error,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (_, index) => Container(
                decoration: BoxDecoration(
                  color: colorsByTheme(context)
                      .backgroundTheme, //colorsByTheme(context).backgroundTheme
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(padding16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Solutions to Climate Change',
                          // ?? 'null name. Someone must be joking here',
                          style: AppTextStyle(context)
                              .getDefaultStyle()
                              .fontSize16,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: spacing6),
                      SizedBox(
                        height: 48.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    TextDoc.txtTopicCategory,
                                    style: AppTextStyle(context)
                                        .getShadowStyle()
                                        .fontSize8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Environtment',
                                      style: AppTextStyle(context)
                                          .getDefaultStyle()
                                          .fontSize8,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: spacing10),
                            const DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColor.container,
                              ),
                              child: SizedBox(
                                height: double.infinity,
                                width: 1.0,
                              ),
                            ),
                            const SizedBox(width: spacing10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    TextDoc.txtTopicLevel,
                                    style: AppTextStyle(context)
                                        .getShadowStyle()
                                        .fontSize8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Upper Intermediate',
                                      style: AppTextStyle(context)
                                          .getDefaultStyle()
                                          .fontSize8,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: spacing20),
                      Text(
                        TempNote.topicDetailsDes,
                        style: AppTextStyle(context).getDefaultStyle(),
                      ),
                      const SizedBox(height: spacing16),
                      Text(
                        TextDoc.txtTopicVocab,
                        style: AppTextStyle(context)
                            .getDefaultStyle()
                            .bold
                            .fontHeader
                            .setColor(AppColor.tertiary),
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0.0),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const PhraseCard();
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: spacing20,
                        ),
                      ),
                      const SizedBox(height: spacing16),
                      Text(
                        TextDoc.txtTopicQuestions,
                        style: AppTextStyle(context)
                            .getDefaultStyle()
                            .bold
                            .fontHeader
                            .setColor(AppColor.tertiary),
                      ),
                      const SizedBox(height: spacing8),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0.0),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return QuestionCard(
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: spacing16,
                        ),
                      ),
                      const SizedBox(
                        height: spacing32,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
