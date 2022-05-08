import 'dart:async';

import 'package:flutter/material.dart';
import '../model/status.dart';
import '../utils/bottomnavbar.dart';
import '../utils/constants.dart';
import '../widgets/progico.dart';

import '../widgets/cirperind.dart';

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

const _btnIconStart = Icon(Icons.play_arrow);
const _btnIconResumePomodoro = Icon(Icons.play_arrow);
const _btnIconStartShortBreak = Icon(Icons.pause);
const _btnIconStartLongBreak = Icon(Icons.pause_circle_filled);
const _btnIconStartNewSet = Icon(Icons.play_arrow);
const _btnIconPause = Icon(Icons.pause);
const _btnIconReset = Icon(Icons.rotate_right);
int remainingTime = pomodoroTotalTime;

Text secondtoFormatted = Text(
  _secondToFormattedString(remainingTime),
  style: const TextStyle(fontSize: 35),
);

String mainBtnText = _btnTextStart;
Icon mainBtnIcon = _btnIconStart;
String title = '39 Kilo';
PomoStatus pomoStatus = PomoStatus.paused;
late Timer _timer;
int pomoNum = 0;
int setNum = 0;

class _PomoHomeState extends State<PomoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Pomonum: $pomoNum',
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Set: $setNum',
                style: const TextStyle(fontSize: 22),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Circular.indiKeytir,
                    const SizedBox(height: 10),
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
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          tooltip: mainBtnText,
          onPressed: () {
            _mainButtonPressed();
          },
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomNavBar.nav,
    );
  }

  _mainButtonPressed() {
    switch (pomoStatus) {
      case PomoStatus.running:
        // TODO: Handle this case.
        break;
      case PomoStatus.paused:
        _startPomodoroCountdown();
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
                    mainBtnIcon = _btnIconStart;
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

  _cancelTimer() {
    _timer.cancel();
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
