import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/features/topic/presentation/widgets/topic_card.dart';
import 'package:flutter/material.dart';

class UpperIntermediateTopicView extends StatefulWidget {
  const UpperIntermediateTopicView({super.key});

  @override
  State<UpperIntermediateTopicView> createState() => _UpperIntermediateTopicViewState();
}

class _UpperIntermediateTopicViewState extends State<UpperIntermediateTopicView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (context, index) => const TopicCard(),
          separatorBuilder: (context, index) =>
              const SizedBox(height: spacing8),
          itemCount: 3),
    );
  }
}
