import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/features/topic/presentation/widgets/topic_card.dart';
import 'package:flutter/material.dart';

class PreIntermediateTopicView extends StatefulWidget {
  const PreIntermediateTopicView({super.key});

  final int length = 9;

  @override
  State<PreIntermediateTopicView> createState() =>
      _PreIntermediateTopicViewState();
}

class _PreIntermediateTopicViewState extends State<PreIntermediateTopicView> {
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
            } else if (index == widget.length - 1) {
              return Container(
                margin: const EdgeInsets.only(bottom: spacing16),
                child: const TopicCard(),
              );
            } else {
              return const TopicCard();
            }
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: spacing8),
          itemCount: widget.length),
    );
  }
}
