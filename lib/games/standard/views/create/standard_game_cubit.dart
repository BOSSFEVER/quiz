import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz/games/standard/domain/entities/standard_round_entity.dart';

import '../../domain/logic/standard_logic.dart';

class StandardGameCubit extends Cubit<StandardGameState> {
  StandardGameCubit(this._standardLogic) : super(StandardGameState(rounds: _standardLogic.getRounds(), index: 0));

  final StandardLogic _standardLogic;

  void addRound() {
    _standardLogic.addRound();
  }

  List<StandardRoundEntity> getRounds() {
    return _standardLogic.getRounds();
  }

  void setIndex(int index) {
    emit(state.copyWith(index: index));
  }
}

class StandardGameState extends Equatable {
  const StandardGameState({required this.rounds, required this.index});

  final List<StandardRoundEntity> rounds;

  final int index;

  StandardGameState copyWith({int? index, List<StandardRoundEntity>? rounds}) {
    return StandardGameState(
      rounds: rounds ?? this.rounds,
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [index, ...rounds];
}
