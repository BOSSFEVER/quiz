import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:quiz/menu/domain/logic/create_logic.dart';

import 'game_card.dart';

class BattleScreen extends StatelessWidget {
  const BattleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Battle'),
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
              child: ListView.separated(
                itemBuilder: (context, index) => index < createLogic.getGames().length
                    ? GameCard(index: index + 1, game: createLogic.getGames()[index])
                    : Card(
                        color: Colors.greenAccent.shade700,
                        child: SizedBox(
                          height: 64,
                          child: Center(
                            child: Text(
                              'Add Game',
                              style: context.theme.textTheme.headlineSmall!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 8),
                itemCount: createLogic.getGames().length + 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
