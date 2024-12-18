import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_battle_state.dart';

class NewBattleCubit extends Cubit<NewBattleState> {
  NewBattleCubit() : super(NewBattleState('', false, ''));

  void setPath(String? path) {
    if (path != null) {
      emit(state.copyWith(path: path, loading: false));
    } else {
      emit(state.copyWith(loading: false));
    }
  }

  void setLoading() {
    emit(state.copyWith(loading: true));
  }

  void setName(String name) {
    emit(state.copyWith(name: name));
  }
}
