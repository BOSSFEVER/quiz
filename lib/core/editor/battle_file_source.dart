import 'dart:io';

import 'package:quiz/core/editor/file_writer.dart';
import 'package:quiz/menu/domain/entities/game.dart';

import '../app/version.dart';

class BattleFileSource {
  BattleFileSource(String path) : _path = path;

  String _path;
  late final FileWriter _fw;
  late final List<Game> _games;

  void createNewBattle(String name) {
    _path = _path + Platform.pathSeparator + name + Platform.pathSeparator;
    _fw = FileWriter(_path);
    _fw.writeMetadata({
      'title': name,
      'appVersion': AppVersion.instance.getAppVersion(),
      'lastEdited': DateTime.now().toIso8601String(),
    });
    _games = [];
  }

  List<Game> readGames() {
    return _games;
  }

  void updateGame() {}

  void removeGame() {}

  void createGame() {}
}
