import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/features/connect_teacher/presentation/views/connect_teacher_view.dart';
import 'package:fluentfolio/src/features/topic_details/presentation/widgets/phrase_card.dart';
import 'package:fluentfolio/src/features/topic_details/presentation/widgets/question_card.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:fluentfolio/src/shared/widgets/buttons/elevated_button.dart';
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
  final bool _bookmark = false;

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
            expandedHeight: 165.0,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title: _showTitle
                  ? Text(
                      'Solutions to Climate Change',
                      style: AppTextStyle(context)
                          .getDefaultStyle()
                          .fontSize16
                          .setHeight(0.9),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : null,
              background: SizedBox(
                height: 144.0,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: TempNote.imgTopicUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, error, stackTrace) => const Icon(
                    Icons.error_outline_rounded,
                    size: 32,
                    color: Colors.red,
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
                        height: spacing16,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: spacing16,
          right: spacing16,
          bottom: spacing24,
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedCustom(
                  title: TextDoc.txtTalk,
                  height: spacing48,
                  ontap: () {
                    Navigator.pushNamed(context, ConnectTeacherView.routeName);
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(left: spacing8),
              padding: const EdgeInsets.all(padding8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(radius12)),
                border: Border.all(
                  width: _bookmark ? 2.0 : 1.0,
                  color: _bookmark ? AppColor.error : AppColor.shadow,
                ),
              ),
              child: GestureDetector(
                onTap: () {},
                child: _bookmark
                    ? ImageHelper.loadFromAsset(AssetHelper.icoHeart)
                    : ImageHelper.loadFromAsset(
                        AssetHelper.icoFilledHeart,
                        tintColor: AppColor.error,
                      ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: padding8,
              ),
              padding: const EdgeInsets.all(padding8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: AppColor.shadow,
                ),
              ),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.feedback_outlined,
                  color: AppColor.shadow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
