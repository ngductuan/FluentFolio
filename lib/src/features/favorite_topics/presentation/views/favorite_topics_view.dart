import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/features/favorite_topics/presentation/widgets/favorite_topic_card.dart';
import 'package:flutter/material.dart';

class FavoriteTopicsView extends StatefulWidget {
  const FavoriteTopicsView({Key? key}) : super(key: key);

  final int length = 6;

  @override
  State<FavoriteTopicsView> createState() => _FavoriteTopicsViewState();
}

class _FavoriteTopicsViewState extends State<FavoriteTopicsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing10),
      child: SingleChildScrollView(
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  margin: const EdgeInsets.only(top: spacing16),
                  child: const FavoriteTopicCard(),
                );
              } else if (index == widget.length - 1) {
                return Container(
                  margin: const EdgeInsets.only(bottom: spacing16),
                  child: const FavoriteTopicCard(),
                );
              } else {
                return const FavoriteTopicCard();
              }
            },
            separatorBuilder: (context, index) =>
                const SizedBox(height: spacing8),
            itemCount: widget.length),
      ),
    );
  }
}
