import 'package:equatable/equatable.dart';
import 'package:quiz/menu/domain/entities/game.dart';

class BattleEditorState extends Equatable {
  const BattleEditorState(this.games);

  final List<Game> games;

  @override
  List<Object?> get props => games;
}
