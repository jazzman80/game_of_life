import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life/application/game_logic.dart';
import 'package:game_of_life/application/game_state.dart';

class GameArea extends ConsumerWidget {
  const GameArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<bool> children = ref.watch(gameProvider);
    GameState gameState = ref.watch(gameStateProvider);

    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 30,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
      ),
      itemCount: children.length,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: gameState == GameState.stop
              ? () => ref.read(gameProvider.notifier).switchElement(index)
              : null,
          child: Container(
            color: children[index]
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[300],
          ),
        );
      },
    );
  }
}
