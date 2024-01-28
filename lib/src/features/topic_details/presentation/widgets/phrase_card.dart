import 'package:fluentfolio/src/constants/styles.dart';
import 'package:flutter/material.dart';

class PhraseCard extends StatelessWidget {
  const PhraseCard({super.key});

  final bool bookmark = false;

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            color: colorsByTheme(context).backgroundCardsChip,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadow.shade200,
                blurRadius: 4.0,
                spreadRadius: 1.0,
                offset: const Offset(1, 2),
              )
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
            // expandedAlignment: Alignment.topLeft,

            // For expansion
            childrenPadding: const EdgeInsets.only(
              left: padding32,
              right: padding16,
              bottom: padding12,
            ),
            // For main
            tilePadding:
                const EdgeInsets.fromLTRB(padding16, padding8, padding8, 0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'clickbait',
                        style: AppTextStyle(context)
                            .getDefaultStyle()
                            .bold
                            .setColor(AppColor.mainColor1),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: bookmark
                          ? const Icon(
                              Icons.bookmark,
                              color: AppColor.mainColor1,
                              size: 24.0,
                            )
                          : const Icon(
                              Icons.bookmark_border,
                              color: AppColor.shadow,
                              size: 24.0,
                            ),
                    )
                  ],
                ),
                Text(
                  "/ˈklɪkbeɪt/",
                  style: AppTextStyle(context)
                      .getDefaultStyle()
                      .setTextSize(14)
                      .setFontFamily(noToSansFont),
                ),
                const SizedBox(height: spacing4),
                // ...TempNote.phraseTranslations.map(
                //   // ...TempNote.phraseTranslations!.map(
                //   (e) => Text(
                //     e + "," ?? 'null meaning',
                //     style: AppTextStyle(context).getDefaultStyle().bold,
                //   ),
                // ),
                Text(
                  TempNote.phraseTranslations.join(", "),
                  style: AppTextStyle(context).getDefaultStyle().bold,
                )
              ],
            ),
            children: [
              const SizedBox(height: spacing2),
              ...TempNote.phraseExamples.map(
                // ...TempNote.phraseExamples!.map(
                (e) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• ",
                      style: AppTextStyle(context).getDefaultStyle(),
                    ),
                    Expanded(
                      child: Text(
                        e ?? 'null example',
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
