import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';

import '../routing/router.dart';

class BossfeverQuizApp extends StatelessWidget {
  const BossfeverQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'BOSSFEVER quiz',
      debugShowCheckedModeBanner: false,
      theme: BFTheme.createDarkTheme(),
    );
  }
}
