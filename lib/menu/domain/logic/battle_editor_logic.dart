import 'package:quiz/menu/domain/entities/game.dart';
import 'package:quiz/menu/domain/repository/battle_editor_repository.dart';

class BattleEditorLogic {
  const BattleEditorLogic(this.repo);

  final BattleEditorRepository repo;

  Stream<List<Game>> subscribeToGames() {
    return repo.subscribeToGames();
  }

  void createNewGame(String title, String type) {
    repo.createNewGame(title, type);
  }

  void deleteGame(int index) {
    repo.deleteGame(index);
  }
}
