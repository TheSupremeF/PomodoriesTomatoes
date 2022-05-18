import 'package:flutter/material.dart';
import '../utils/clockwatch.dart';
import '../utils/darkmode.dart';

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
        icon: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
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
              PopupMenuItem(
                  value: SettingsMenu.clockStyle,
                  child: Center(
                      child: Column(
                    children: const [
                      Center(child: Text('Style Changer')),
                      ClockwatchToggle(),
                    ],
                  ))),
              PopupMenuItem(
                  value: SettingsMenu.about,
                  child: Column(
                    children: [
                      Divider(
                        thickness: 1,
                        color: Theme.of(context).focusColor,
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
