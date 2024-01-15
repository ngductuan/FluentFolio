import 'dart:async';
import 'package:fluentfolio/src/constants/dim_constants.dart';
import 'package:fluentfolio/src/constants/textstyle_constant.dart';
import 'package:fluentfolio/src/features/accounts/presentation/views/sign_in_screen.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:fluentfolio/src/shared/widegts/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static String routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(
      String image, String title, String des, AlignmentGeometry align) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: align,
          child: ImageHelper.loadFromAsset(
            image,
            height: 400,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                des,
                style: TextStyles.defaultStyle,
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _pageController,
          children: [
            _buildItemIntroScreen(
                AssetHelper.imgIntroFirst,
                'Book a flight',
                'Found a flight that matches your destination and schedule? Book it instantly.',
                Alignment.centerLeft),
            _buildItemIntroScreen(
                AssetHelper.imgIntroSecond,
                'Book a flight',
                'Found a flight that matches your destination and schedule? Book it instantly.',
                Alignment.center),
            _buildItemIntroScreen(
                AssetHelper.imgIntroThird,
                'Book a flight',
                'Found a flight that matches your destination and schedule? Book it instantly.',
                Alignment.centerRight),
          ],
        ),
        Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 3,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotWidth: kMinPadding,
                        dotHeight: kMinPadding,
                        activeDotColor: Colors.orange),
                  ),
                ),
                StreamBuilder<int>(
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                        flex: 3,
                        child: ButtonWidget(
                          title: snapshot.data != 2 ? 'Next' : 'Get started',
                          ontap: () {
                            if (_pageController.page != 2) {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn);
                            } else {
                              Navigator.of(context)
                                  .pushNamed(SignInScreen.routeName);
                            }
                          },
                        ),
                      );
                    })
              ],
            ))
      ]),
    );
  }
}
