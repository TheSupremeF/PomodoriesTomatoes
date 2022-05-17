import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodororeyistasakli/utils/clockwatch.dart';
import 'package:pomodororeyistasakli/utils/darkmode.dart';
import '../screens/home.dart';
import '../themes/themes.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeModeCubit>(
          create: (BuildContext context) => ThemeModeCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ClockwatchCubit(),
        ),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeMode?>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Pomodoro baba',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: PomoAppThemes.allTime,
            ),
            home: const PomoHome(),
            themeMode: themeState,
            darkTheme: ThemeData.dark(),
          );
        },
      ),
    );
  }
}
