import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:game_of_life/UI/buttons_area.dart';
import 'package:game_of_life/UI/game_area.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Game of Life',
            style: GoogleFonts.shareTechMono().copyWith(fontSize: 22),
          ),
        ),
      ),
      body: const Center(child: GameArea()),
      bottomNavigationBar: const ButtonsArea(),
    );
  }
}
