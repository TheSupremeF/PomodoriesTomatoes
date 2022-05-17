import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodororeyistasakli/utils/darkmode.dart';
import '../screens/home.dart';
import '../themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeModeCubit>(
      create: (BuildContext context) => ThemeModeCubit(),
      child: BlocBuilder<ThemeModeCubit, ThemeMode?>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Pomodoro baba',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: PomoAppThemes.allTime,
            ),
            home: const PomoHome(),
            themeMode: state,
            darkTheme: ThemeData.dark(),
          );
        },
      ),
    );
  }
}
