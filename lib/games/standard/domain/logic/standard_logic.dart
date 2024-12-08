import 'package:quiz/games/standard/domain/repositories/standard_game_repository.dart';

import '../entities/standard_round_entity.dart';

class StandardLogic {
  StandardLogic(this.repo);

  final StandardGameRepository repo;

  void addRound() {
    repo.addRound();
  }

  List<StandardRoundEntity> getRounds() {
    return repo.getRounds();
  }
}
