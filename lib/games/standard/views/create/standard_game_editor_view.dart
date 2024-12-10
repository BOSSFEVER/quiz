import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/core/logger/logger.dart';
import 'package:quiz/games/standard/domain/logic/standard_logic.dart';
import 'package:quiz/games/standard/views/create/navigation_button.dart';
import 'package:quiz/games/standard/views/create/standard_game_editor.dart';
import 'package:quiz/games/standard/views/create/standard_game_cubit.dart';

class StandardGameEditorView extends StatelessWidget {
  const StandardGameEditorView({super.key});

  final Logger logger = const Logger('StandardGameEditorView / VIEW');

  @override
  Widget build(BuildContext context) {
    logger.info('[VIEW] Entered StandardGameEditorView');
    return BlocProvider(
      create: (context) => StandardGameEditorCubit(context.read<StandardLogic>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Game Editor'),
        ),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 400,
              decoration: BoxDecoration(color: BFColors.background, boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 2,
                  blurRadius: 16,
                ),
              ]),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<StandardGameEditorCubit, StandardGameEditorState>(
                  builder: (context, state) {
                    return ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return BFButton(
                            onPressed: () {},
                            width: double.infinity,
                            colorPack: BFColorPacks.purple,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            trailing: Icons.chevron_right,
                            child: Text('Metadata'),
                          );
                        } else if (index == state.rounds.length + 1) {
                          return BFButton(
                            onPressed: () {},
                            width: double.infinity,
                            leading: Icons.add,
                            colorPack: BFColorPacks.green,
                            child: Text('Add Round'),
                          );
                        } else {
                          final round = state.rounds[index - 1];
                          return NavigationButton(
                            title: round.shorthand.isNotEmpty
                                ? round.shorthand
                                : round.question.isNotEmpty
                                    ? round.question
                                    : 'Error',
                            index: index - 1,
                          );
                        }
                      },
                      separatorBuilder: (BuildContext context, int index) => SizedBox(
                        height: 8,
                      ),
                      itemCount: state.rounds.length + 2,
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<StandardGameEditorCubit, StandardGameEditorState>(
                  buildWhen: (prev, now) => prev.index != now.index,
                  builder: (context, state) {
                    if (state.index < 0 || state.rounds.isEmpty) {
                      return Placeholder();
                    }
                    return StandardGameEditor(
                      round: state.rounds[state.index],
                      index: state.index,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
