import 'package:quiz/games/standard/domain/repositories/standard_game_repository.dart';

import '../entities/standard_round_entity.dart';

class StandardLogic {
  StandardLogic(this.repo);

  final StandardGameRepository repo;

  void addRound() {
    repo.addRound();
  }

  Stream<List<StandardRoundEntity>> subscribeToRounds() {
    return repo.subscribeToRounds();
  }

  void updateShorthand(int index, String text) {
    repo.updateShorthand(index, text);
  }

  void updateQuestion(int index, String text) {
    repo.updateQuestion(index, text);
  }

  void updateAnswer(int index, String text) {
    repo.updateAnswer(index, text);
  }

  void updateExtra(int index, String text) {
    repo.updateExtra(index, text);
  }
}
