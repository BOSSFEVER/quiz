import 'package:flutter/material.dart';
import 'package:quiz/core/app/bossfever_quiz_app.dart';
import 'package:quiz/games/standard/init.dart';

void init() {
  // Register all games
  initStandardGame();
}

void main() {
  init();

  runApp(const BossfeverQuizApp());
}
