import 'dart:async';

import '../entities/standard_round_entity.dart';

class StandardGameRepository {
  StandardGameRepository() {
    _roundStream = StreamController.broadcast(
      onListen: _updateRounds,
    );
    _rounds = [
      StandardRoundEntity(shorthand: 'empty'),
      StandardRoundEntity(shorthand: 'second'),
      StandardRoundEntity(shorthand: 'x'),
      StandardRoundEntity(question: 'who is the one responsible\nI am, who are you?', answer: 'me'),
      StandardRoundEntity(extra: 'empty extra please here'),
      StandardRoundEntity(shorthand: 'Me meme '),
      StandardRoundEntity(shorthand: 'This is an affront'),
      StandardRoundEntity(shorthand: 'Nobody makes me sad'),
    ];
  }

  late final List<StandardRoundEntity> _rounds;

  late final StreamController<List<StandardRoundEntity>> _roundStream;

  void _updateRounds() {
    _roundStream.add(_rounds.toList());
  }

  void _updateAt(int index, StandardRoundEntity Function(StandardRoundEntity) updater) {
    StandardRoundEntity round = _rounds.removeAt(index);
    _rounds.insert(index, updater(round));
    _updateRounds();
  }

  Stream<List<StandardRoundEntity>> subscribeToRounds() {
    return _roundStream.stream;
  }

  void addRound() {
    _rounds.add(StandardRoundEntity());
    _updateRounds();
  }

  void updateShorthand(int index, String text) {
    _updateAt(index, (round) => round.copyWith(shorthand: text));
  }

  void updateQuestion(int index, String text) {
    _updateAt(index, (round) => round.copyWith(question: text));
  }

  void updateAnswer(int index, String text) {
    _updateAt(index, (round) => round.copyWith(answer: text));
  }

  void updateExtra(int index, String text) {
    _updateAt(index, (round) => round.copyWith(extra: text));
  }
}
