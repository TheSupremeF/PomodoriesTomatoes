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

const _btnIconStart = 'Start Pomodoro';
const _btnIconResumePomodoro = 'Resume Pomodoro';
const _btnIconStartShortBreak = 'Take Short Break';
const _btnIconStartLongBreak = 'Take Long Break';
const _btnIconStartNewSet = 'Start New Set';
const _btnIconPause = 'Pause';
const _btnIconReset = 'Reset';
int remainingTime = pomodoroTotalTime;

Text secondtoFormatted = Text(
  _secondToFormattedString(remainingTime),
  style: const TextStyle(fontSize: 35),
);

String mainBtnText = _btnTextStart;
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
          tooltip: "Play kenks",
          onPressed: () {},
          child: const Icon(Icons.play_arrow),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomNavBar.nav,
    );
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
