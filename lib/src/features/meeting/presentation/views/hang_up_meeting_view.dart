import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/shared/widgets/buttons/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HangUpMeetingView extends StatefulWidget {
  const HangUpMeetingView({super.key});

  static String routeName = '/hang_up_meeting_view';

  @override
  State<HangUpMeetingView> createState() => _HangUpMeetingViewState();
}

class _HangUpMeetingViewState extends State<HangUpMeetingView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            padding24, padding48 + padding12, padding24, padding24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetHelper.iluHangUpMeeting,
              fit: BoxFit.fill,
              width: width / 2,
              height: width / 2,
            ),
            const SizedBox(height: spacing24),
            Text(
              TextDoc.txtRejoinDesc,
              style: AppTextStyle(context).getShadowStyle().fontSize8.light,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: spacing12),
            AppFilledButton(
              text: TextDoc.txtRejoin,
              onPressed: () {
                Navigator.pop(context, true);
              },
              minimumSize: Size(width / 2, 48),
            ),
            const Spacer(),
            Text(
              TextDoc.txtDoneDesc,
              style: AppTextStyle(context).getShadowStyle().fontSize8.light,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: spacing12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: AppColor.support,
                shadowColor: AppColor.shadow.shade200,
                minimumSize: const Size.fromHeight(48),
              ),
              child: Text(TextDoc.txtDone,
                  style: AppTextStyle(context).getDefaultStyle()),
            )
          ],
        ),
      ),
    );
  }
}
