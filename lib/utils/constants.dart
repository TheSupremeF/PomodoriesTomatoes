import 'package:pomodororeyistasakli/model/status.dart';
import 'package:flutter/material.dart';

const pomodoroTotalTime = 25 * 60;
const shortBreakTime = 5 * 60;
const longBreakTime = 15 * 60;
const pomodorosPerSet = 4;

const Map<PomoStatus, String> statusDescription = {
  PomoStatus.running: "Pomodoro is running brah, don't let this make you gone!",
  PomoStatus.paused: 'Pomo paused, come back over ulan!',
  PomoStatus.finished: 'It just finished sweetheart! Congrats to you!',
  PomoStatus.longbreakRunning: 'Good to see that you came this long!',
  PomoStatus.longbreakPaused: 'Okay! Go on!',
  PomoStatus.shortbreakRunning: 'Rest of the sets are tapping!',
  PomoStatus.shortbreakPaused: 'Oh come on!'
};

const Map<PomoStatus, MaterialColor> statusColor = {
  PomoStatus.running: Colors.green,
  PomoStatus.paused: Colors.orange,
  PomoStatus.finished: Colors.blue,
  PomoStatus.longbreakRunning: Colors.red,
  PomoStatus.longbreakPaused: Colors.orange,
  PomoStatus.shortbreakRunning: Colors.red,
  PomoStatus.shortbreakPaused: Colors.orange
};
