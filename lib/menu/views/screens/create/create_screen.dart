import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/core/routing/routes.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: Center(
        child: Transform.scale(
          scale: 1.3,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Create and Edit',
                    style: context.theme.textTheme.headlineSmall,
                  ),
                  SizedBox(height: 64),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BFButton(
                        onPressed: () => context.pushReplacementNamed(Routes.createBattle),
                        leading: Icons.add,
                        colorPack: BFColorPacks.pink,
                        child: Text('New'),
                      ),
                      SizedBox(width: 128),
                      BFButton(
                        onPressed: () => context.pushReplacementNamed(Routes.createBattle),
                        leading: Icons.upload,
                        colorPack: BFColorPacks.cyan,
                        child: Text('Load'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void launchUrl(Uri uri) {}
