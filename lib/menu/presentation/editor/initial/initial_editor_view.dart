import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:quiz/menu/presentation/editor/new/new_battle_popup.dart';

class InitialEditorView extends StatelessWidget {
  const InitialEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editor'),
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
                        onPressed: () => showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => NewBattlePopup(),
                        ),
                        leading: Icons.add,
                        colorPack: BFColorPacks.green,
                        child: Text('New'),
                      ),
                      SizedBox(width: 128),
                      BFButton(
                        onPressed: null,
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
