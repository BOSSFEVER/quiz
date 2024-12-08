import 'package:quiz/core/framework/game_framework.dart';
import 'package:quiz/games/standard/views/create/create_standard_game.dart';

void initStandardGame() {
  GameFramework.registerGame('standard', () => const CreateStandardGame());
}
