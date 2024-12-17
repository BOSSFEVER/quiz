import 'package:quiz/core/editor/battle_file_source.dart';

import '../../menu/domain/entities/game.dart';

class FileSource {
  BattleFileSource? _battleFileSource;

  BattleFileSource get battle => _battleFileSource!;

  void createNewBattleAt(String path) async {
    _battleFileSource = BattleFileSource(path);
    battle.createNewBattle('New New Game');
  }

  void updateGame() {
    battle.updateGame();
  }

  void createGame() {
    battle.createGame();
  }

  void removeGame() {
    battle.removeGame();
  }

  List<Game> readGames() {
    return battle.readGames();
  }

  void reset() {
    _battleFileSource = null;
  }
}
