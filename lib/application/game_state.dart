import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life/application/game_logic.dart';

enum GameState { progress, pause, stop }

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier(this.ref) : super(GameState.stop);

  Ref ref;

  void play() {
    if (state == GameState.stop) {
      state = GameState.progress;
      setGameProviderState();
    }
  }

  void pause() {
    if (state == GameState.progress) {
      state = GameState.pause;
      setGameProviderState();
    } else if (state == GameState.pause) {
      state = GameState.progress;
      setGameProviderState();
    }
  }

  void stop() {
    if (state != GameState.stop) {
      state = GameState.stop;
      setGameProviderState();
    }
  }

  void setGameProviderState() {
    ref.read(gameProvider.notifier).setGameState(state);
  }
}

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>(
    (ref) => GameStateNotifier(ref));
