import 'package:quiz/menu/domain/entities/game.dart';

const createLogic = CreateLogic();

class CreateLogic {
  const CreateLogic();

  List<Game> getGames() {
    return [
      Game(title: 'Simple Questions', numberOfRounds: 24, gameType: 'standard'),
      Game(title: 'Chemistry Question', numberOfRounds: 12, gameType: 'standard'),
      Game(title: 'Audio Backwards', numberOfRounds: 43, gameType: 'standard'),
    ];
  }
}
