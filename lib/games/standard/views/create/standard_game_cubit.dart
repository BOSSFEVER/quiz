import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz/games/standard/domain/entities/standard_round_entity.dart';

import '../../domain/logic/standard_logic.dart';

class StandardGameEditorCubit extends Cubit<StandardGameEditorState> {
  StandardGameEditorCubit(this._standardLogic) : super(StandardGameEditorState(rounds: [], index: 0)) {
    subscription = _standardLogic.subscribeToRounds().listen((rounds) {
      emit(state.copyWith(rounds: rounds));
    });
  }

  late final StreamSubscription<List<StandardRoundEntity>> subscription;

  final StandardLogic _standardLogic;

  void addRound() {
    _standardLogic.addRound();
  }

  void updateShorthand(String text) {
    _standardLogic.updateShorthand(state.index, text);
  }

  void updateQuestion(String text) {
    _standardLogic.updateQuestion(state.index, text);
  }

  void updateAnswer(String text) {
    _standardLogic.updateAnswer(state.index, text);
  }

  void updateExtra(String text) {
    _standardLogic.updateExtra(state.index, text);
  }

  void setIndex(int index) {
    emit(state.copyWith(index: index));
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}

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
