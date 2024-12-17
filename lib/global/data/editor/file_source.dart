import 'package:quiz/menu/domain/entities/game.dart';

import 'battle_file.dart';

class FileSource {
  BattleFile? _battleFileSource;

  BattleFile get battle => _battleFileSource!;

  void createNewBattleAt(String path) async {
    _battleFileSource = BattleFile(path);
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
