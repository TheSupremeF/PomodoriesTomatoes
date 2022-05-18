import 'package:PomodoriesTomatoes/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../model/status.dart';

class CirPerInd extends StatelessWidget {
  const CirPerInd(
      {Key? key,
      required this.percentCalc,
      required this.textWidget,
      required this.status})
      : super(key: key);
  final Widget? textWidget;
  final double percentCalc;
  final PomoStatus status;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: false,
      lineWidth: 25,
      percent: percentCalc,
      linearGradient: LinearGradient(colors: statusGradient[status]!),
      // progressColor: statusColor[pomoStatus],
      radius: 120,
      circularStrokeCap: CircularStrokeCap.round,
      center: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        height: 100,
        child: textWidget,
      ),
    );
  }
}
