import 'package:flutter/material.dart';

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

class Textus extends StatelessWidget {
  const Textus({Key? key, required this.fontFamily, required this.reis})
      : super(key: key);
  final String reis;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      reis,
      style: TextStyle(fontSize: 35, fontFamily: fontFamily),
    );
  }
}
