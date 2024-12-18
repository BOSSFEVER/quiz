import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/core/routing/routes.dart';
import 'package:quiz/menu/presentation/home/widgets/home_view_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
            HomeViewButton(text: 'CREATE', onPressed: () => context.goNamed(Routes.editor), colors: BFColorPacks.berry),
            HomeViewButton(text: 'JOIN', onPressed: () => context.goNamed(Routes.join), colors: BFColorPacks.blue),
            HomeViewButton(text: 'HOST', onPressed: () => context.goNamed(Routes.host), colors: BFColorPacks.green),
          ],
        ),
      ),
    );
  }
}
