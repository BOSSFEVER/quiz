import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/core/routing/routes.dart';
import 'package:quiz/menu/views/screens/create/battle/battle_screen.dart';
import 'package:quiz/menu/views/screens/create/create_screen.dart';
import 'package:quiz/menu/views/screens/create/game/game_screen.dart';
import 'package:quiz/menu/views/screens/create/new/new_screen.dart';
import 'package:quiz/menu/views/screens/home/home_screen.dart';

final router = GoRouter(
  debugLogDiagnostics: false,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: Routes.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: '/settings',
          name: Routes.settings,
          builder: (context, state) => const OtherScreen(),
        ),
        GoRoute(
          path: '/join',
          name: Routes.join,
          builder: (context, state) => const OtherScreen(),
          routes: [
            GoRoute(
              path: '/lobby',
              name: Routes.lobby,
              builder: (context, state) => const OtherScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/create',
          name: Routes.create,
          builder: (context, state) => const CreateScreen(),
          routes: [
            GoRoute(
              path: '/create_new',
              name: Routes.createNew,
              builder: (context, state) => const NewScreen(),
            ),
            GoRoute(
              path: '/create_battle',
              name: Routes.createBattle,
              builder: (context, state) => const BattleScreen(),
            ),
            GoRoute(
              path: '/create_game',
              name: Routes.createGame,
              builder: (context, state) => const GameScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/host',
          name: Routes.host,
          builder: (context, state) => const OtherScreen(),
        ),
      ],
    ),
  ],
);

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GoRouter.of(context).state!.uri.toString()),
        leading: context.canPop() ? IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)) : SizedBox(),
      ),
      body: GoRouter.of(context).state!.name == Routes.join
          ? Center(child: FilledButton(onPressed: () => context.goNamed('menu::lobby'), child: Text('to lobby')))
          : Container(
              color: Colors.blueGrey.shade900,
            ),
    );
  }
}
