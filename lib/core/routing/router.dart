import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/core/routing/routes.dart';
import 'package:quiz/menu/domain/entities/game.dart';
import 'package:quiz/menu/presentation/editor/battle/battle_editor_view.dart';
import 'package:quiz/menu/presentation/editor/initial/initial_editor_view.dart';
import 'package:quiz/menu/presentation/editor/game/game_editor_view.dart';
import 'package:quiz/menu/presentation/home/home_view.dart';

final router = GoRouter(
  debugLogDiagnostics: false,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: Routes.home,
      builder: (context, state) => const HomeView(),
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
          path: '/editor',
          name: Routes.editor,
          builder: (context, state) => const InitialEditorView(),
          routes: [
            GoRoute(
              path: '/battle_editor',
              name: Routes.battleEditor,
              builder: (context, state) => const BattleEditorView(),
            ),
            GoRoute(
              path: '/game_editor',
              name: Routes.gameEditor,
              builder: (context, state) => GameEditorView(game: state.extra as Game),
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
