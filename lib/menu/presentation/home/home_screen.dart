import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/core/routing/routes.dart';
import 'package:quiz/menu/presentation/home/home_screen_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: OverflowBox(
        maxHeight: double.infinity,
        maxWidth: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeScreenButton(text: 'CREATE', onPressed: () => context.goNamed(Routes.editor), colors: BFColorPacks.berry),
            HomeScreenButton(text: 'JOIN', onPressed: () => context.goNamed(Routes.join), colors: BFColorPacks.blue),
            HomeScreenButton(text: 'HOST', onPressed: () => context.goNamed(Routes.host), colors: BFColorPacks.green),
          ],
        ),
      ),
    );
  }
}
