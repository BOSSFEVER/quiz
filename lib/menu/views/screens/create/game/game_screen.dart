import 'package:flutter/material.dart';
import 'package:quiz/core/framework/game_framework.dart';
import 'package:quiz/menu/domain/entities/game.dart';

class GameEditorView extends StatelessWidget {
  const GameEditorView({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    Widget Function()? gameEditorView = GameFramework.getEditorViewForGameType(game.gameType);

    if (gameEditorView != null) {
      return gameEditorView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('GameEditor Error'),
      ),
      body: ErrorWidget('Sorry, but couldn\'t find a view for ${game.gameType}.'),
    );
  }
}
