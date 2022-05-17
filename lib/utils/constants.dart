import 'package:google_fonts/google_fonts.dart';

import '../model/status.dart';
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

const Map<PomoStatus, List<Color>> statusGradient = {
  PomoStatus.running: [
    Colors.orange,
    Color.fromARGB(255, 251, 255, 0),
    Color.fromARGB(255, 0, 255, 17),
  ],
  PomoStatus.paused: [Colors.deepOrange, Colors.orange],
  PomoStatus.finished: [Color.fromARGB(255, 33, 149, 243)],
  PomoStatus.longbreakRunning: [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green
  ],
  PomoStatus.longbreakPaused: [Colors.deepOrange, Colors.orange],
  PomoStatus.shortbreakRunning: [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green
  ],
  PomoStatus.shortbreakPaused: [Colors.deepOrange, Colors.orange]
};

Map<Po, String?> fonts = {
  Po.roboto: GoogleFonts.roboto().fontFamily,
  Po.adamina: GoogleFonts.adamina().fontFamily,
  Po.montserrat: GoogleFonts.montserrat().fontFamily,
};
