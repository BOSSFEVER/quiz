import 'dart:async';

import 'package:quiz/global/data/editor/file_source.dart';
import 'package:quiz/menu/domain/entities/game.dart';

class BattleEditorRepository {
  BattleEditorRepository(this._fileSource) {
    _readGames();
    _gamesStream = StreamController.broadcast(onListen: _updateGames);
  }

  final FileSource _fileSource;
  late final List<Game> _games;
  late final StreamController<List<Game>> _gamesStream;

  void _readGames() {
    _games = _fileSource.readGames();
    _updateGames();
  }

  void createNewGame(String title, String type) {
    _games.add(Game(title: title, gameType: type, numberOfRounds: 0));
    _updateGames();
  }

  void deleteGame(int index) {
    _games.removeAt(index);
    _updateGames();
  }

  void _updateGames() {
    _gamesStream.add(_games.toList());
  }

  Stream<List<Game>> subscribeToGames() {
    return _gamesStream.stream;
  }
}
