part of 'new_battle_cubit.dart';

class NewBattleState extends Equatable {
  const NewBattleState(this.path, this.loading, this.name);

  final String path;
  final bool loading;
  final String name;

  @override
  List<Object> get props => [loading, path, name];

  NewBattleState copyWith({String? name, String? path, bool? loading}) {
    return NewBattleState(path ?? this.path, loading ?? this.loading, name ?? this.name);
  }
}
