import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pomodororeyistasakli/themes/themes.dart';
import 'package:pomodororeyistasakli/utils/clockwatch.dart';
import '../model/status.dart';
import '../utils/togglesdropdowns.dart';
import '../utils/constants.dart';
import '../widgets/progico.dart';

// import '../widgets/cirperind.dart';

class PomoHome extends StatefulWidget {
  const PomoHome({Key? key}) : super(key: key);

  @override
  State<PomoHome> createState() => _PomoHomeState();
}

const _btnTextStart = 'Start Pomodoro';
const _btnTextResumePomodoro = 'Resume Pomodoro';
const _btnTextStartShortBreak = 'Take Short Break';
const _btnTextStartLongBreak = 'Take Long Break';
const _btnTextStartNewSet = 'Start New Set';
const _btnTextPause = 'Pause';
const _btnTextReset = 'Reset';

const _btnIconStart = Icon(Icons.play_arrow, color: Colors.white);
const _btnIconResumePomodoro = Icon(Icons.play_arrow, color: Colors.white);
const _btnIconStartShortBreak = Icon(Icons.pause, color: Colors.white);
const _btnIconStartLongBreak =
    Icon(Icons.pause_circle_filled, color: Colors.white);
const _btnIconStartNewSet = Icon(Icons.play_arrow, color: Colors.white);
const _btnIconPause = Icon(Icons.pause, color: Colors.white);
const _btnIconReset = Icon(Icons.rotate_right, color: Colors.white);

PomoStatus pomoStatus = PomoStatus.paused;

class _PomoHomeState extends State<PomoHome> {
  int remainingTime = pomodoroTotalTime;
  String mainBtnText = _btnTextStart;
  Icon mainBtnIcon = _btnIconStart;
  String title = 'Pomodoro app';
  Timer? _timer;
  int pomoNum = 0;
  int setNum = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClockwatchCubit, String?>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: const [SettingsMenuDropdown()],
            title: Text(
              title,
              style: TextStyle(fontFamily: state),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  _emptyBox(10),
                  Text(
                    'Pomonum: $pomoNum',
                    style: TextStyle(fontFamily: state, fontSize: 32),
                  ),
                  _emptyBox(10),
                  Text(
                    'Set: ',
                    style: TextStyle(fontFamily: state, fontSize: 22),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          animation: false,
                          lineWidth: 25,
                          percent: _getPomoPercentage(),
                          linearGradient: LinearGradient(
                              colors: statusGradient[pomoStatus]!),
                          // progressColor: statusColor[pomoStatus],
                          radius: 120,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Container(
                            alignment: Alignment.center,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            height: 100,
                            child: Textus(
                                reis: _secondToFormattedString(remainingTime),
                                fontFamily: state),
                          ),
                        ),
                        _emptyBox(10),
                        ProgIco(
                            total: pomodorosPerSet,
                            done: pomoNum - (setNum * pomodorosPerSet))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: floatingActionMenu(),
        );
      },
    );
  }

  Column floatingActionMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
            backgroundColor: Colors.orange,
            tooltip: mainBtnText,
            onPressed: () {
              _mainButtonPressed();
            },
            child: mainBtnIcon,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        const Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
        FloatingActionButton(
            backgroundColor: Colors.orange,
            tooltip: "Reset",
            onPressed: () {},
            child: const Icon(
              Icons.restore,
              size: 30,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        const Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
      ],
    );
  }

  SizedBox _emptyBox(double? boxsize) => SizedBox(height: boxsize);

  _cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  String _secondToFormattedString(int seconds) {
    int roundedMinutes = seconds ~/ 60;
    int remainingSeconds = seconds - (roundedMinutes * 60);
    String remainingSecondsFormatted;
    if (remainingSeconds < 10) {
      remainingSecondsFormatted = "0$remainingSeconds";
    } else {
      remainingSecondsFormatted = remainingSeconds.toString();
    }
    return '$roundedMinutes:$remainingSecondsFormatted';
  }

  _mainButtonPressed() {
    switch (pomoStatus) {
      case PomoStatus.paused:
        _startPomodoroCountdown();
        break;
      case PomoStatus.running:
        // TODO: Handle this case.
        break;
      case PomoStatus.finished:
        // TODO: Handle this case.
        break;
      case PomoStatus.longbreakRunning:
        // TODO: Handle this case.
        break;
      case PomoStatus.longbreakPaused:
        // TODO: Handle this case.
        break;
      case PomoStatus.shortbreakRunning:
        // TODO: Handle this case.
        break;
      case PomoStatus.shortbreakPaused:
        // TODO: Handle this case.
        break;
    }
  }

  _getPomoPercentage() {
    int totalTime;
    switch (pomoStatus) {
      case PomoStatus.running:
        totalTime = pomodoroTotalTime;
        break;
      case PomoStatus.paused:
        totalTime = pomodoroTotalTime;
        break;
      case PomoStatus.finished:
        totalTime = pomodoroTotalTime;
        break;
      case PomoStatus.longbreakRunning:
        totalTime = pomodoroTotalTime;
        break;
      case PomoStatus.longbreakPaused:
        totalTime = pomodoroTotalTime;
        break;
      case PomoStatus.shortbreakRunning:
        totalTime = pomodoroTotalTime;
        break;
      case PomoStatus.shortbreakPaused:
        totalTime = pomodoroTotalTime;
        break;
    }
    double percentage = (totalTime - remainingTime) / totalTime;
    return percentage;
  }

  _startPomodoroCountdown() {
    pomoStatus = PomoStatus.running;
    _cancelTimer();
    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) => {
              if (remainingTime > 0)
                {
                  setState(() {
                    remainingTime--;
                    mainBtnText = _btnTextPause;
                    mainBtnIcon = _btnIconPause;
                  })
                }
              else
                {
                  pomoNum++,
                  _cancelTimer(),
                  if (pomoNum % pomodorosPerSet == 0)
                    {
                      pomoStatus = PomoStatus.longbreakPaused,
                      setState(() {
                        remainingTime = longBreakTime;
                        mainBtnText = _btnTextStartLongBreak;
                        mainBtnIcon = _btnIconStartLongBreak;
                      }),
                    }
                  else
                    {
                      pomoStatus = PomoStatus.shortbreakPaused,
                      setState(() {
                        remainingTime = shortBreakTime;
                        mainBtnText = _btnTextStartShortBreak;
                        mainBtnIcon = _btnIconStartShortBreak;
                      }),
                    }
                }
            });
  }
}
