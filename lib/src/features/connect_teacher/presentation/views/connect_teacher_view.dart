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
  // Giả lập kết nối
  bool connectedTeacher = false;
  bool launchingSession = false;

  @override
  void initState() {
    super.initState();
    _startConnectTeacher();
  }

  void _startConnectTeacher() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        connectedTeacher = true;
      });
    });

    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        launchingSession = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: launchingSession
          ? AppColorSwatch.supportSwatch[900]
          : AppColorSwatch.mainColor2Swatch[900],
      body: Stack(children: [
        Positioned(
          child: Stack(children: [
            if (!launchingSession)
              WaveWidget(
                config: CustomConfig(
                  colors: [
                    connectedTeacher
                        ? AppColorSwatch.mainColor1Swatch[900]!
                        : AppColorSwatch.secondarySwatch[900]!
                  ],
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
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              TextDoc.txtCancelTitle,
                              style: AppTextStyle(context)
                                  .getDefaultStyle()
                                  .fontSize16,
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              TextDoc.txtCancelContent,
                              style: AppTextStyle(context)
                                  .getDefaultStyle()
                                  .fontSize8
                                  .light,
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget>[
                              Row(children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColorSwatch
                                            .secondarySwatch[900]),
                                    child: Text(
                                      TextDoc.txtNo,
                                      style: AppTextStyle(context)
                                          .getDefaultStyle(),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TextButton(
                                    child: Text(
                                      TextDoc.txtYes,
                                      style: AppTextStyle(context)
                                          .getDefaultStyle(),
                                      textAlign: TextAlign.center,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ]),
                            ],
                          );
                        });
                    // Navigator.of(context).pop();
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (launchingSession)
                    const CircleAvatar(
                      radius: 50.0, // Đường kính của Avatar
                      backgroundImage: AssetImage(
                          'assets/avatar/avatar-01.png'), // Ảnh đại diện
                    ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    connectedTeacher
                        ? (launchingSession
                            ? '${TextDoc.txtConnectedTeacher}Nguyễn Bình${TextDoc.txtLaunchSession}'
                            : TextDoc.txtConnectedTeacher)
                        : TextDoc.txtFindTeacher,
                    style: AppTextStyle(context).getDefaultStyle().fontSize16,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
