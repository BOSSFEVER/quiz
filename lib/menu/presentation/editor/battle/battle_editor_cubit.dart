import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/game.dart';
import '../../../domain/logic/battle_editor_logic.dart';

class BattleEditorCubit extends Cubit<BattleEditorState> {
  BattleEditorCubit(this._battleLogic) : super(BattleEditorState([])) {
    _subscription = _battleLogic.subscribeToGames().listen((games) => emit(BattleEditorState(games)));
  }

  final BattleEditorLogic _battleLogic;
  late final StreamSubscription<List<Game>> _subscription;

  void createNewGame(String title, String type) {
    _battleLogic.createNewGame(title, type);
  }

  void deleteGame(int index) {
    _battleLogic.deleteGame(index);
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

class BattleEditorState extends Equatable {
  const BattleEditorState(this.games);

  final List<Game> games;

  @override
  List<Object?> get props => games;
}
