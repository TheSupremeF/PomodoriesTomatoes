import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorChangeCubit extends Cubit<MaterialColor> {
  ColorChangeCubit() : super(Colors.orange);
}

class PomoAppThemes extends StatelessWidget {
  const PomoAppThemes({Key? key}) : super(key: key);
  static const MaterialColor allTime = Colors.orange;
  static const Color buttonIconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Textus extends StatelessWidget {
  const Textus({Key? key, required this.fontFamily, required this.text})
      : super(key: key);
  final String text;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 35, fontFamily: fontFamily),
    );
  }
}
