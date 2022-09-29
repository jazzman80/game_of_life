import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life/UI/main_screen.dart';
import 'package:game_of_life/core/theme.dart';

void main() {
  runApp(const GameOfLifeApp());
}

class GameOfLifeApp extends StatelessWidget {
  const GameOfLifeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Game of Life',
        theme: appTheme,
        home: const MainScreen(),
      ),
    );
  }
}
