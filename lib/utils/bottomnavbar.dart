import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

enum SettingsMenu { darkMode, about }

class BottomNavBarSettingsButton extends StatefulWidget {
  static ThemeMode themeMode = ThemeMode.system;
  const BottomNavBarSettingsButton({Key? key}) : super(key: key);

  @override
  State<BottomNavBarSettingsButton> createState() =>
      _BottomNavBarSettingsButtonState();
}

class _BottomNavBarSettingsButtonState
    extends State<BottomNavBarSettingsButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SettingsMenu>(
        offset: const Offset(-100, -100),
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
                        children: [
                          const Center(child: Text('Dark mode')),
                          ToggleSwitch(
                            onToggle: (index) {
                              log("$index'e basıldı.");
                              setState(() {
                                switch (index) {
                                  case 0:
                                    BottomNavBarSettingsButton.themeMode =
                                        ThemeMode.system;

                                    break;
                                  case 1:
                                    BottomNavBarSettingsButton.themeMode =
                                        ThemeMode.dark;

                                    break;
                                  case 2:
                                    BottomNavBarSettingsButton.themeMode =
                                        ThemeMode.light;

                                    break;
                                  default:
                                }
                              });
                            },
                            animate: true,
                            totalSwitches: 3,
                            activeBgColor: const [
                              Colors.green,
                              Colors.black,
                              Color.fromARGB(255, 0, 0, 105)
                            ],
                            activeFgColor: Colors.white,
                            icons: const [
                              Icons.android,
                              Icons.dark_mode,
                              Icons.sunny
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                  value: SettingsMenu.about,
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Row(children: const [
                        Icon(Icons.logo_dev_outlined),
                        Text("Pomodoro app by"),
                        Text(
                          " TheSupreme",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ],
                  ))
            ]);
  }
}

class BottomNavBar {
  static List<Color> colorListFun() {
    const List<Color> _colorList = [
      Color.fromARGB(255, 255, 153, 0),
      Color.fromARGB(160, 255, 153, 0),
      Color.fromARGB(37, 255, 255, 255)
    ];
    return _colorList;
  }

  static Container nav = Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: colorListFun())),
    child: Container(
      color: const Color.fromARGB(123, 255, 255, 255),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [BottomNavBarSettingsButton(), Text('Settings')],
          ),
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(0, 255, 255, 255)),
                  overlayColor: MaterialStateProperty.all(
                      const Color.fromARGB(100, 110, 110, 110))),
              onPressed: () {},
              child: Row(
                children: [
                  Column(
                    children: const [
                      Icon(
                        Icons.restore,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        'Reset',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      )
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                ],
              )),
        ],
      ),
    ),
  );
}
