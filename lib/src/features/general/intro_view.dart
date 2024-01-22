import 'dart:async';
import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:fluentfolio/src/shared/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  static String routeName = '/intro_screen';

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
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
          height: spacing24 * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle(context).getDefaultStyle().bold,
              ),
              const SizedBox(
                height: spacing24,
              ),
              Text(
                des,
                style: AppTextStyle(context).getDefaultStyle(),
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
            left: spacing16,
            right: spacing16,
            bottom: spacing16 * 3,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotWidth: padding4,
                        dotHeight: padding4,
                        activeDotColor: Colors.orange),
                  ),
                ),
                StreamBuilder<int>(
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                        flex: 3,
                        child: ElevatedCustom(
                          title: snapshot.data != 2 ? 'Next' : 'Get started',
                          radius: radius24,
                          width: spacing24,
                          color: AppColor.mainColor2,
                          ontap: () {
                            if (_pageController.page != 2) {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn);
                            } else {
                              // Navigator.of(context)
                              //     .pushNamed(SignInScreen.routeName);
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
