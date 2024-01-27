import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/features/topic/presentation/widgets/topic_card.dart';
import 'package:flutter/material.dart';

class ElementaryTopicView extends StatefulWidget {
  const ElementaryTopicView({super.key});

  @override
  State<ElementaryTopicView> createState() => _ElementaryTopicViewState();
}

class _ElementaryTopicViewState extends State<ElementaryTopicView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing10),
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
          itemCount: 9),
    );
  }
}
