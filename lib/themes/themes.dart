import 'package:flutter/material.dart';
import 'package:pomodororeyistasakli/utils/constants.dart';

class PomoAppThemes {
  static MaterialColor allTime = Colors.orange;
  static MaterialColor onPressedColor = Colors.orange;
  static Color buttonIconColor = Colors.white;
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

class Columnus extends StatelessWidget {
  const Columnus({Key? key, required this.fontFamily}) : super(key: key);

  final String? fontFamily;

  static int get defTime => pomodoroTotalTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.arrow_drop_up,
          size: 50,
        ),
        Text(
          _secondToFormattedString(defTime),
          style: TextStyle(fontSize: 35, fontFamily: fontFamily),
        ),
        const Icon(
          Icons.arrow_drop_down,
          size: 50,
        ),
      ],
    );
  }
}
