import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/games/standard/domain/logic/standard_logic.dart';
import 'package:quiz/games/standard/domain/repositories/standard_game_repository.dart';
import 'package:quiz/games/standard/views/create/round_card.dart';
import 'package:quiz/games/standard/views/create/settings_card.dart';
import 'package:quiz/games/standard/views/create/standard_game_cubit.dart';

class CreateStandardGame extends StatelessWidget {
  const CreateStandardGame({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StandardGameCubit(StandardLogic(StandardGameRepository())),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Game'),
        ),
        body: BlocBuilder<StandardGameCubit, StandardGameState>(
          builder: (context, state) {
            return Row(
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
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return BFButton(
                            onPressed: () => {},
                            width: double.infinity,
                            colorPack: BFColorPacks.purple,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            trailing: Icons.chevron_right,
                            child: Text('Metadata'),
                          );
                        } else if (index == state.rounds.length + 1) {
                          return BFButton(
                            onPressed: () => {},
                            width: double.infinity,
                            leading: Icons.add,
                            colorPack: BFColorPacks.green,
                            child: Text('Add Round'),
                          );
                        } else {
                          final round = state.rounds[index - 1];
                          return RoundCard(
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
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SettingsCard(
                      round: state.rounds[state.index],
                      index: state.index,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
