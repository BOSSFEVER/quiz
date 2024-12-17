import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/core/app/version.dart';
import 'package:quiz/global/data/editor/file_source.dart';

import '../routing/router.dart';

class BossfeverQuizApp extends StatelessWidget {
  const BossfeverQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppVersion();
    return MultiRepositoryProvider(
      providers: [
        // Data
        RepositoryProvider<FileSource>(create: (context) => FileSource()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'BOSSFEVER quiz',
        debugShowCheckedModeBanner: false,
        theme: BFTheme.createDarkTheme(),
      ),
    );
  }
}
