import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodororeyistasakli/utils/darkmode.dart';

enum SettingsMenu { darkMode, clockStyle, about }

class BottomNavBarSettingsButton extends StatefulWidget {
  const BottomNavBarSettingsButton({Key? key}) : super(key: key);

  @override
  State<BottomNavBarSettingsButton> createState() =>
      _BottomNavBarSettingsButtonState();
}

String? fontFamilyA;

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            fontFamilyA = GoogleFonts.roboto().fontFamily;
                          });
                        },
                        child: Text(
                          "Roboto",
                          style: TextStyle(
                              fontFamily: GoogleFonts.roboto().fontFamily),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            fontFamilyA = GoogleFonts.adamina().fontFamily;
                          });
                        },
                        child: Text(
                          "Adamina",
                          style: TextStyle(
                              fontFamily: GoogleFonts.adamina().fontFamily),
                        ),
                      ),
                    ],
                  )),
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
                  )),
            ]);
  }
}

class BottomNavBar {
  static final List<Color> _colorList = [
    const Color.fromARGB(255, 255, 153, 0),
    const Color.fromARGB(160, 255, 153, 0),
    const Color.fromARGB(37, 255, 255, 255)
  ];

  static Container nav = Container(
      decoration: const BoxDecoration(color: Colors.orange
/*           gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: _colorList) */
          ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          width: 100,
          color: Colors.deepOrange,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              BottomNavBarSettingsButton(),
              Text('Settings', style: TextStyle(color: Colors.white))
            ],
          ),
        ),
        Container(
          width: 100,
          color: Colors.deepOrange,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  highlightColor: const Color.fromARGB(0, 255, 255, 255),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.restore,
                    size: 30,
                    color: Colors.white,
                  )),
              const Text('Reset', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ]));
}
