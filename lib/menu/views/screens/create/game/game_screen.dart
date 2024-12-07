import 'package:flutter/material.dart';
import 'package:quiz/core/framework/game_framework.dart';
import 'package:quiz/menu/domain/entities/game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    Widget Function()? gameEditor = GameFramework.getEditorForGameType(game.gameType);

    if (gameEditor != null) {
      return gameEditor();
    }

    return Placeholder();
  }
}
