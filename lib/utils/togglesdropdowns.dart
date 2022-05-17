import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodororeyistasakli/utils/clockwatch.dart';
import 'package:pomodororeyistasakli/utils/darkmode.dart';

enum SettingsMenu { darkMode, clockStyle, about }

class SettingsMenuDropdown extends StatefulWidget {
  const SettingsMenuDropdown({Key? key}) : super(key: key);

  @override
  State<SettingsMenuDropdown> createState() => _SettingsMenuDropdownState();
}

class _SettingsMenuDropdownState extends State<SettingsMenuDropdown> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SettingsMenu>(
        offset: const Offset(50, -100),
        icon: const Icon(Icons.settings, color: Colors.white),
        shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.0, color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SettingsMenu>>[
              PopupMenuItem<SettingsMenu>(
                value: SettingsMenu.darkMode,
                child: SizedBox(
                  width: 230,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        children: const [
                          Center(child: Text('Dark mode')),
                          Center(
                            child: DarkModeToggle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const PopupMenuItem(
                  value: SettingsMenu.clockStyle,
                  child: Center(child: ClockwatchToggle())),
              PopupMenuItem(
                  value: SettingsMenu.about,
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Row(children: [
                        Icon(Icons.logo_dev_outlined,
                            color: Theme.of(context).backgroundColor),
                        const Text("Pomodoro app by"),
                        const Text(
                          " TheSupreme",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ],
                  )),
            ]);
  }
}

class ClockwatchChangerButtons extends StatelessWidget {
  const ClockwatchChangerButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClockwatchStyleChanger(
          fontName: "Roboto",
          fontFamily: GoogleFonts.roboto().fontFamily,
          callBackFunc: () {
            context.read<ClockwatchCubit>().roboto();
          },
        ),
        ClockwatchStyleChanger(
          fontName: "Adamina",
          fontFamily: GoogleFonts.adamina().fontFamily,
          callBackFunc: () {
            context.read<ClockwatchCubit>().adamina();
          },
        ),
        ClockwatchStyleChanger(
          fontName: "Montserrat",
          fontFamily: GoogleFonts.montserrat().fontFamily,
          callBackFunc: () {
            context.read<ClockwatchCubit>().montserrat();
          },
        ),
      ],
    );
  }
}

class FloatingActionMenu extends StatelessWidget {
  const FloatingActionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
