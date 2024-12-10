import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/core/framework/game_framework.dart';
import 'package:quiz/games/standard/views/create/standard_game_editor_view.dart';

import 'domain/logic/standard_logic.dart';
import 'domain/repositories/standard_game_repository.dart';

void initStandardGame() {
  GameFramework.registerGame(
    'standard',
    () => MultiRepositoryProvider(
      providers: [
        // Repository
        RepositoryProvider<StandardGameRepository>(create: (context) => StandardGameRepository()),

        // Logic
        RepositoryProvider<StandardLogic>(create: (context) => StandardLogic(context.read<StandardGameRepository>())),
      ],
      child: const StandardGameEditorView(),
    ),
  );
}
