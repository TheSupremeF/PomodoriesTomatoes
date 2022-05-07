import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomodororeyistasakli/screens/home.dart';
import 'package:pomodororeyistasakli/utils/constants.dart';

class Circular {
  static CircularPercentIndicator indiKeytir = CircularPercentIndicator(
    animation: true,
    lineWidth: 25,
    percent: 0.65,
    progressColor: statusColor[pomoStatus],
    radius: 120,
    circularStrokeCap: CircularStrokeCap.round,
    center: secondtoFormatted,
  );
}
