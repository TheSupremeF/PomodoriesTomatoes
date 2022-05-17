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
        if (index == ThemeMode.system.index) {
          context.read<ThemeModeCubit>().system();
        } else if (index == ThemeMode.light.index) {
          context.read<ThemeModeCubit>().light();
        } else if (index == ThemeMode.dark.index) {
          context.read<ThemeModeCubit>().dark();
        }
      },
      animate: true,
      totalSwitches: 3,
      activeBgColors: const [
        [Colors.green],
        [Colors.black],
        [Color.fromARGB(255, 0, 0, 105)]
      ],
      activeFgColor: Colors.white,
      icons: const [
        Icons.android,
        Icons.sunny,
        Icons.dark_mode,
      ],
    );
  }
}
