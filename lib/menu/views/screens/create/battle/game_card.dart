import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../domain/entities/game.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.index,
    required this.game,
  });

  final int index;
  final Game game;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 32,
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: context.theme.textTheme.headlineSmall,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.title,
                      style: context.theme.textTheme.headlineSmall,
                    ),
                    Text(
                      '${game.gameType}, ${game.numberOfRounds}',
                      style: context.theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BFButton(
                  onPressed: () {},
                  colorPack: BFColorPacks.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 16),
                BFButton(
                  onPressed: () => context.pushNamed(Routes.createGame, extra: game),
                  colorPack: BFColorPacks.cyan,
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
