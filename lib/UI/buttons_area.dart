import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life/application/game_logic.dart';
import 'package:game_of_life/application/game_state.dart';

class ButtonsArea extends ConsumerWidget {
  const ButtonsArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GameState gameState = ref.watch(gameStateProvider);

    return BottomAppBar(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: gameState == GameState.stop
                  ? () {
                      ref.read(gameStateProvider.notifier).play();
                    }
                  : null,
              icon: const Icon(
                Icons.play_circle_outline_outlined,
              ),
              color: Theme.of(context).colorScheme.onPrimary,
              disabledColor: Colors.blueGrey[200],
            ),
            IconButton(
              onPressed: gameState != GameState.stop
                  ? () {
                      ref.read(gameStateProvider.notifier).pause();
                    }
                  : null,
              icon: const Icon(
                Icons.pause_circle_outline_outlined,
              ),
              color: Theme.of(context).colorScheme.onPrimary,
              disabledColor: Colors.blueGrey[200],
            ),
            IconButton(
              onPressed: gameState != GameState.stop
                  ? () {
                      ref.read(gameStateProvider.notifier).stop();
                    }
                  : null,
              icon: const Icon(
                Icons.stop_circle_outlined,
              ),
              color: Theme.of(context).colorScheme.onPrimary,
              disabledColor: Colors.blueGrey[200],
            ),
            IconButton(
              onPressed: gameState == GameState.stop
                  ? () => ref.read(gameProvider.notifier).clear()
                  : null,
              icon: const Icon(
                Icons.refresh_outlined,
              ),
              color: Theme.of(context).colorScheme.onPrimary,
              disabledColor: Colors.blueGrey[200],
            ),
          ],
        ),
      ),
    );
  }
}
