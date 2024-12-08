import '../entities/standard_round_entity.dart';

class StandardGameRepository {
  StandardGameRepository();

  final List<StandardRoundEntity> _rounds = [
    StandardRoundEntity(shorthand: 'numba one'),
    StandardRoundEntity(shorthand: 'second'),
    StandardRoundEntity(shorthand: 'x'),
    StandardRoundEntity(question: 'who is the one responsible', answer: 'me'),
    StandardRoundEntity(extra: 'empty extra please here'),
    StandardRoundEntity(shorthand: 'Me meme '),
    StandardRoundEntity(shorthand: 'This is an affront'),
    StandardRoundEntity(shorthand: 'Nobody makes me sad'),
  ];

  void addRound() {
    _rounds.add(StandardRoundEntity());
  }

  List<StandardRoundEntity> getRounds() {
    return _rounds;
  }
}
