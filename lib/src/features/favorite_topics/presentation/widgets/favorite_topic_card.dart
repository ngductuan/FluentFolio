import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/features/topic_details/presentation/views/topic_details_view.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:flutter/material.dart';

class FavoriteTopicCard extends StatefulWidget {
  const FavoriteTopicCard({super.key});

  final String imgUrl = TempNote.imgTopicUrl2;
  final String topicName = 'Weekend Activities';
  final String topicCategory = 'Daily conversation';
  final bool topicBookmark = true;

  @override
  State<FavoriteTopicCard> createState() => _FavoriteTopicCardState();
}

class _FavoriteTopicCardState extends State<FavoriteTopicCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, TopicDetailsView.routeName);
      },
      child: Container(
        margin: const EdgeInsets.all(spacing8),
        height: 120,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: colorsByTheme(context).backgroundCardsChip,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadow.shade300,
                blurRadius: 4.0,
                spreadRadius: 1.0,
                offset: const Offset(1, 2),
              )
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: CachedNetworkImage(
                imageUrl: widget.imgUrl,
                fit: BoxFit.cover,
                errorWidget: (context, error, stackTrace) => const Icon(
                  Icons.error_outline_rounded,
                  size: 32,
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.topicName,
                            style: AppTextStyle(context).getDefaultStyle().bold,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          width: spacing8,
                        ),
                        GestureDetector(
                            // onTap: () async {
                            //   widget.onTap.call();
                            // },
                            onTap: () {},
                            child: widget.topicBookmark
                                ? ImageHelper.loadFromAsset(
                                    AssetHelper.icoFilledHeart,
                                    tintColor: AppColor.error)
                                : ImageHelper.loadFromAsset(
                                    AssetHelper.icoHeart,
                                    tintColor:
                                        colorsByTheme(context).defaultFont)
                            // : Assets.icon.icHeartFill.svg(
                            //     width: 24,
                            //     height: 24,
                            //     color: AppColor.error,
                            // ),
                            ),
                      ],
                    ),
                    const SizedBox(
                      height: spacing2,
                    ),
                    Text(
                      widget.topicCategory,
                      style: AppTextStyle(context)
                          .getDefaultStyle()
                          .fontSize8
                          .light,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
