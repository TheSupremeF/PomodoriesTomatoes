import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ClockwatchCubit extends Cubit<String?> {
  ClockwatchCubit() : super(GoogleFonts.roboto().fontFamily);

  void roboto() {
    emit(GoogleFonts.roboto().fontFamily);
  }

  void adamina() {
    emit(GoogleFonts.adamina().fontFamily);
  }

  void montserrat() {
    emit(GoogleFonts.montserrat().fontFamily);
  }
}

class ClockwatchStyleChanger extends StatelessWidget {
  final String fontName;
  final String? fontFamily;
  final VoidCallback? callBackFunc;
  const ClockwatchStyleChanger(
      {Key? key,
      required this.fontName,
      required this.fontFamily,
      required this.callBackFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange)),
      onPressed: callBackFunc,
      child: Text(
        fontName,
        style: TextStyle(fontFamily: fontFamily),
      ),
    );
  }
}

class ClockwatchToggle extends StatelessWidget {
  const ClockwatchToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      changeOnTap: true,
      totalSwitches: 3,
      customTextStyles: [
        TextStyle(fontSize: 12, fontFamily: GoogleFonts.roboto().fontFamily),
        TextStyle(fontSize: 9, fontFamily: GoogleFonts.adamina().fontFamily),
        TextStyle(fontSize: 9, fontFamily: GoogleFonts.montserrat().fontFamily),
      ],
      labels: const ['Roboto', 'Adamina', 'Montserrat'],
      onToggle: (index) {
        switch (index) {
          case 0:
            context.read<ClockwatchCubit>().roboto();
            break;
          case 1:
            context.read<ClockwatchCubit>().adamina();
            break;
          case 2:
            context.read<ClockwatchCubit>().montserrat();
            break;
          default:
        }
      },
    );
  }
}
