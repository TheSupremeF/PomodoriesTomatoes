import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../themes/themes.dart';
import '../utils/clockwatch.dart';
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
const _btnTextResumeBreak = 'Resume Break';

const _btnIconStart = Icon(Icons.play_arrow, color: Colors.white);
const _btnIconResumePomodoro = Icon(Icons.play_arrow, color: Colors.white);
const _btnIconStartShortBreak = Icon(Icons.play_arrow, color: Colors.white);
const _btnIconStartLongBreak = Icon(Icons.play_arrow, color: Colors.white);
const _btnIconStartNewSet = Icon(Icons.play_arrow, color: Colors.white);
const _btnIconResumeBreak = Icon(Icons.play_arrow, color: Colors.white);
const _btnIconPause = Icon(Icons.pause, color: Colors.white);

PomoStatus pomoStatus = PomoStatus.paused;

class _PomoHomeState extends State<PomoHome> {
  int countdeLahodras = 0;
  int remainingTime = pomodoroTotalTime;
  String mainBtnText = _btnTextStart;
  Icon mainBtnIcon = _btnIconStart;
  String title = 'Pomodoro app';
  Timer? _timer;
  int pomoNum = 0;
  int setNum = 0;
  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClockwatchCubit, String?>(
      builder: (context, fontStyleState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: PomoAppThemes.allTime,
            actions: const [SettingsMenuDropdown()],
            title: Text(
              title,
              style: TextStyle(color: Colors.white, fontFamily: fontStyleState),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  _emptyBox(10),
                  Text(
                    'Pomonum: $pomoNum',
                    style: TextStyle(fontFamily: fontStyleState, fontSize: 32),
                  ),
                  _emptyBox(10),
                  Text(
                    'Set: $setNum',
                    style: TextStyle(fontFamily: fontStyleState, fontSize: 22),
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
                                text: _secondToFormattedString(remainingTime),
                                fontFamily: fontStyleState),
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
            backgroundColor: PomoAppThemes.allTime,
            tooltip: mainBtnText,
            onPressed: () {
              _mainButtonPressed();
            },
            child: mainBtnIcon,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        const Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
        FloatingActionButton(
            backgroundColor: PomoAppThemes.allTime,
            tooltip: "Reset",
            onPressed: () {
              _count();
              _resetButtonPressed();
            },
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

  Padding _emptyBox(double boxheight) => Padding(
      padding: EdgeInsets.only(top: boxheight / 2, bottom: boxheight / 2));

  _cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  _count() {
    setState(() {
      countdeLahodras++;
      log("$countdeLahodras times pressed.");
      if (countdeLahodras == 19) {
        _showMyDialog();
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey[700],
          title: const Text(
            "Welcome to Count de Lahodras' Lair!",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      gradient: const LinearGradient(colors: <Color>[
                        Color.fromARGB(255, 103, 103, 103),
                        Color.fromARGB(255, 255, 136, 0)
                      ])),
                  child: Row(
                    children: const [
                      Text(' '),
                      Text('I,', style: TextStyle(fontSize: 17)),
                      Text(' Lahodras, ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      Text('shall prevail you!',
                          style: TextStyle(fontSize: 17)),
                    ],
                  ),
                ),
                _emptyBox(10),
                ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('assets/countdelahodras.png'))
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Uh, okay...'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
        _pausePomodoroCountdown();
        break;
      case PomoStatus.finished:
        setState(() {
          setNum++;
          _startPomodoroCountdown();
        });
        break;
      case PomoStatus.longbreakRunning:
        _pauseLongbreakCountdown();
        break;
      case PomoStatus.longbreakPaused:
        _startLongBreak();
        break;
      case PomoStatus.shortbreakRunning:
        _pauseShortbreakCountdown();
        break;
      case PomoStatus.shortbreakPaused:
        _startShortBreak();
        break;
    }
  }

  double _getPomoPercentage() {
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

  void _startPomodoroCountdown() {
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
                  _playSound(),
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

  void _pausePomodoroCountdown() {
    pomoStatus = PomoStatus.paused;
    _cancelTimer();
    setState(() {
      mainBtnText = _btnTextResumePomodoro;
      mainBtnIcon = _btnIconResumePomodoro;
    });
  }

  void _resetButtonPressed() {
    _cancelTimer();
    _stopCountdown();
  }

  void _stopCountdown() {
    pomoStatus = PomoStatus.paused;
    setState(() {
      pomoNum = 0;
      setNum = 0;
      mainBtnIcon = _btnIconStart;
      mainBtnText = _btnTextStart;
      remainingTime = pomodoroTotalTime;
    });
  }

  void _pauseShortbreakCountdown() {
    pomoStatus = PomoStatus.shortbreakPaused;
    _pauseBreakCountdown();
  }

  void _pauseLongbreakCountdown() {
    pomoStatus = PomoStatus.longbreakPaused;
    _pauseBreakCountdown();
  }

  void _pauseBreakCountdown() {
    _cancelTimer();
    setState(() {
      mainBtnText = _btnTextResumeBreak;
      mainBtnIcon = _btnIconResumeBreak;
    });
  }

  void _startShortBreak() {
    pomoStatus = PomoStatus.shortbreakRunning;
    _cancelTimer();
    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) => {
              if (remainingTime > 0)
                {
                  setState(
                    () {
                      mainBtnText = _btnTextPause;
                      mainBtnIcon = _btnIconPause;
                      remainingTime--;
                    },
                  )
                }
              else
                {
                  //todo play sound
                  _playSound(),
                  remainingTime = pomodoroTotalTime,
                  _cancelTimer(),
                  pomoStatus = PomoStatus.paused,
                  setState(
                    () {
                      mainBtnText = _btnTextStart;
                      mainBtnIcon = _btnIconStart;
                    },
                  )
                }
            });
  }

  void _startLongBreak() {
    pomoStatus = PomoStatus.longbreakRunning;
    _cancelTimer();
    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) => {
              if (remainingTime > 0)
                {
                  setState(
                    () {
                      mainBtnText = _btnTextPause;
                      mainBtnIcon = _btnIconPause;
                      remainingTime--;
                    },
                  )
                }
              else
                {
                  //todo play sound
                  _playSound(),
                  remainingTime = pomodoroTotalTime,
                  _cancelTimer(),
                  pomoStatus = PomoStatus.finished,
                  setState(
                    () {
                      mainBtnText = _btnTextStartNewSet;
                      mainBtnIcon = _btnIconStartNewSet;
                    },
                  )
                }
            });
  }

  _playSound() {
    log("Sound playing");
  }
}
