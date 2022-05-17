import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ThemeModeCubit extends Cubit<ThemeMode?> {
  ThemeModeCubit() : super(ThemeMode.system);

  void system() => emit(ThemeMode.system);
  void dark() => emit(ThemeMode.dark);
  void light() => emit(ThemeMode.light);
}

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      onToggle: (index) {
        switch (index) {
          case 0:
            context.read<ThemeModeCubit>().system();
            break;
          case 1:
            context.read<ThemeModeCubit>().dark();
            break;
          case 2:
            context.read<ThemeModeCubit>().light();
            break;

          default:
        }
      },
      animate: true,
      totalSwitches: 3,
      activeBgColor: const [
        Colors.green,
        Colors.black,
        Color.fromARGB(255, 0, 0, 105)
      ],
      activeFgColor: Colors.white,
      icons: const [Icons.android, Icons.dark_mode, Icons.sunny],
    );
  }
}
