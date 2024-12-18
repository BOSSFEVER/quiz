import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quiz/games/standard/domain/entities/standard_round_entity.dart';
import 'package:quiz/games/standard/views/editor/bloc/standard_game_editor_state.dart';

import '../../../domain/logic/standard_logic.dart';

class StandardGameEditorCubit extends Cubit<StandardGameEditorState> {
  StandardGameEditorCubit(this._standardLogic) : super(StandardGameEditorState(rounds: [], index: 0)) {
    _subscription = _standardLogic.subscribeToRounds().listen((rounds) {
      emit(state.copyWith(rounds: rounds));
    });
  }

  late final StreamSubscription<List<StandardRoundEntity>> _subscription;

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
    _subscription.cancel();
    return super.close();
  }
}
