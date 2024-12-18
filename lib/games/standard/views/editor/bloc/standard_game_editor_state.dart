import 'package:equatable/equatable.dart';
import 'package:quiz/games/standard/domain/entities/standard_round_entity.dart';

class StandardGameEditorState extends Equatable {
  const StandardGameEditorState({required this.rounds, required this.index});

  final List<StandardRoundEntity> rounds;

  final int index;

  StandardGameEditorState copyWith({int? index, List<StandardRoundEntity>? rounds}) {
    return StandardGameEditorState(
      rounds: rounds ?? this.rounds,
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [index, ...rounds];
}
