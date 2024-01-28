import 'package:fluentfolio/src/constants/styles.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            color: colorsByTheme(context).backgroundCardsChip,
            borderRadius: BorderRadius.circular(radius12),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadow.shade200,
                blurRadius: 4.0,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: ExpansionTile(
            collapsedBackgroundColor:
                colorsByTheme(context).backgroundCardsChip,
            backgroundColor: colorsByTheme(context).backgroundCardsChip,
            iconColor: colorsByTheme(context).expansionIcon,
            collapsedIconColor: colorsByTheme(context).expansionIcon,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            // For expansion
            childrenPadding:
                const EdgeInsets.fromLTRB(padding16, padding8, padding8, 0),
            // For main
            tilePadding:
                const EdgeInsets.fromLTRB(padding16, padding8, padding8, 0),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${index + 1}.',
                  style: AppTextStyle(context).getDefaultStyle().bold,
                ),
                const SizedBox(width: spacing8),
                Expanded(
                  child: Text(
                    TempNote.topicDetailQues,
                    style: AppTextStyle(context).getDefaultStyle().bold,
                  ),
                ),
              ],
            ),
            children: [
              Text(
                TextDoc.txtTopicAnswers,
                style: AppTextStyle(context).getDefaultStyle().fontCaption,
              ),
              const SizedBox(height: spacing2),
              ...TempNote.topicDetailAnswer.map(
                (e) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '•',
                      style: AppTextStyle(context)
                          .getDefaultStyle()
                          .bold
                          .setFontFamily(noToSansFont)
                          .setTextSize(20),
                    ),
                    const SizedBox(width: spacing8),
                    Expanded(
                      child: Text(
                        e ?? 'null answer',
                        style: AppTextStyle(context).getDefaultStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
