import 'package:flutter/material.dart';

abstract class GameFramework {
  static final Map<String, Widget Function()> _games = {};

  static void registerGame(String gameType, Widget Function() editor) {
    _games[gameType] = editor;
  }

  static Widget Function()? getEditorViewForGameType(String gameType) {
    return _games[gameType];
  }
}
