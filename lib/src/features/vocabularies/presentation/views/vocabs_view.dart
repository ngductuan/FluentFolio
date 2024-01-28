import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/features/vocabularies/presentation/widgets/vocabs_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VocabsView extends StatefulWidget {
  const VocabsView({super.key});

  final int length = 9;

  @override
  State<VocabsView> createState() => _VocabsViewState();
}

class _VocabsViewState extends State<VocabsView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: spacing10),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                margin: const EdgeInsets.only(top: spacing24),
                child: const VocabCard(),
              );
            } else if (index == widget.length - 1) {
              return Container(
                margin: const EdgeInsets.only(bottom: spacing24),
                child: const VocabCard(),
              );
            } else {
              return const VocabCard();
            }
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: spacing8),
          itemCount: 9),
    );
  }
}
