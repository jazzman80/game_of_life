import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life/core/constants.dart';
import 'package:game_of_life/application/game_state.dart';

class GameNotifier extends StateNotifier<List<bool>> {
  GameNotifier() : super(List.generate(fieldSize, (index) => false)) {
    play();
  }

  GameState _gameState = GameState.stop;

  void setGameState(GameState gameState) {
    _gameState = gameState;
  }

  void play() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (_gameState == GameState.progress) {
        state = [
          for (int index = 0; index < state.length; index++)
            nextElementState(index),
        ];
      }
    }
  }

  int rating(int index) {
    if (index < 0) {
      index += fieldSize;
    } else if (index > fieldSize - 1) {
      index -= fieldSize;
    }
    return state[index] ? 1 : 0;
  }

  bool nextElementState(int index) {
    bool nextState = state[index];
    int nextRating = rating(index - fieldSideLength - 1) +
        rating(index - fieldSideLength) +
        rating(index - fieldSideLength + 1) +
        rating(index - 1) +
        rating(index + 1) +
        rating(index + fieldSideLength - 1) +
        rating(index + fieldSideLength) +
        rating(index + fieldSideLength + 1);

    if (!state[index] && nextRating == 3) {
      nextState = true;
    } else if (state[index] && (nextRating < 2 || nextRating > 3)) {
      nextState = false;
    }

    return nextState;
  }

  void switchElement(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) !state[i] else state[i],
    ];
  }

  void clear() {
    state = List.generate(fieldSize, (index) => false);
  }
}

final gameProvider = StateNotifierProvider<GameNotifier, List<bool>>((ref) {
  return GameNotifier();
});
