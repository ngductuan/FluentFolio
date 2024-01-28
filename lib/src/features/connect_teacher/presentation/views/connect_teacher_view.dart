import 'package:fluentfolio/src/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class ConnectTeacherView extends StatefulWidget {
  const ConnectTeacherView({super.key});

  static String routeName = '/connect_teacher_view';

  @override
  State<ConnectTeacherView> createState() => _ConnectTeacherViewState();
}

class _ConnectTeacherViewState extends State<ConnectTeacherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorSwatch.mainColor2Swatch[900],
      body: Stack(children: [
        Positioned(
          child: Stack(children: [
            WaveWidget(
              config: CustomConfig(
                colors: [AppColorSwatch.secondarySwatch[900]!],
                durations: [5000],
                heightPercentages: [0.6],
              ),
              size: const Size(double.infinity, double.infinity),
              waveAmplitude: 10.0,
            ),
            Positioned(
              bottom: 60,
              right: 0,
              left: 0,
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close,
                      color: AppColorSwatch.secondarySwatch[900]),
                  label: Text(
                    TextDoc.txtCancel,
                    style:
                        TextStyle(color: AppColorSwatch.secondarySwatch[900]),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                TextDoc.txtFindTeacher,
                style: AppTextStyle(context).getDefaultStyle(),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
