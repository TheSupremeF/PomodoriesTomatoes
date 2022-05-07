import 'package:flutter/material.dart';
import 'package:pomodororeyistasakli/themes/themes.dart';

class ProgIco extends StatelessWidget {
  final int total;
  final int done;

  const ProgIco({Key? key, required this.total, required this.done})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconSize = 50.0;

    final doneIcon = Icon(Icons.check_circle_outlined,
        color: PomoAppThemes.allTime, size: iconSize);
    final undoneIcon = Icon(Icons.circle_outlined,
        color: PomoAppThemes.allTime, size: iconSize);

    List<Icon> iconsList = <Icon>[];

    for (int i = 0; i < total; i++) {
      if (i < done) {
        iconsList.add(doneIcon);
      } else {
        iconsList.add(undoneIcon);
      }
    }
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: iconsList, mainAxisAlignment: MainAxisAlignment.center));
  }
}
