import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/core/editor/file_source.dart';
import 'package:quiz/menu/domain/logic/battle_editor_logic.dart';
import 'package:quiz/menu/domain/repository/battle_editor_repository.dart';
import 'package:quiz/menu/presentation/editor/battle/battle_editor_cubit.dart';

import 'game_card.dart';

class BattleEditorView extends StatelessWidget {
  const BattleEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => BattleEditorRepository(context.read<FileSource>())),
        RepositoryProvider(create: (context) => BattleEditorLogic(context.read<BattleEditorRepository>())),
      ],
      child: BlocProvider(
        create: (context) => BattleEditorCubit(context.read<BattleEditorLogic>()),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Battle Editor'),
          ),
          body: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 300,
                decoration: BoxDecoration(color: BFColors.background, boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2,
                    blurRadius: 16,
                  ),
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      BFButton(
                        onPressed: () => {},
                        width: double.infinity,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        trailing: Icons.chevron_right,
                        child: Text('Metadata'),
                      ),
                      SizedBox(height: 8),
                      BFButton(
                        onPressed: null,
                        width: double.infinity,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        trailing: Icons.chevron_right,
                        child: Text('Theme'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BlocBuilder<BattleEditorCubit, BattleEditorState>(
                    builder: (context, state) {
                      return ListView.separated(
                        itemBuilder: (context, index) => index < state.games.length
                            ? GameCard(index: index, game: state.games[index])
                            : Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                                child: BFButton(
                                  height: 64,
                                  onPressed: () {
                                    context.read<BattleEditorCubit>().createNewGame('title', 'standard');
                                  },
                                  width: double.infinity,
                                  colorPack: BFColorPacks.green,
                                  child: Row(
                                    children: [
                                      Icon(Icons.add, size: 32, color: Colors.white),
                                      SizedBox(width: 4),
                                      Text('Add Game', style: TextStyle(fontSize: 24)),
                                    ],
                                  ),
                                ),
                              ),
                        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 4),
                        itemCount: state.games.length + 1,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
