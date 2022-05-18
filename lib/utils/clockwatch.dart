import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/status.dart';
import '../utils/constants.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ClockwatchCubit extends Cubit<String?> {
  ClockwatchCubit() : super(GoogleFonts.roboto().fontFamily);

  void roboto() => emit(GoogleFonts.roboto().fontFamily);

  void adamina() => emit(GoogleFonts.adamina().fontFamily);

  void montserrat() => emit(GoogleFonts.montserrat().fontFamily);
}

class ClockwatchToggle extends StatelessWidget {
  const ClockwatchToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      changeOnTap: true,
      totalSwitches: 3,
      customTextStyles: [
        TextStyle(fontSize: 12, fontFamily: fonts[Po.roboto]),
        TextStyle(fontSize: 9, fontFamily: fonts[Po.adamina]),
        TextStyle(fontSize: 9, fontFamily: fonts[Po.montserrat]),
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
