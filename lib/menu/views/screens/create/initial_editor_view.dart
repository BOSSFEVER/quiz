import 'package:bf_theme/bf_theme.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/core/editor/file_source.dart';
import 'package:quiz/core/routing/routes.dart';

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
                        onPressed: () => context.pushReplacementNamed(Routes.battleEditor),
                        leading: Icons.add,
                        colorPack: BFColorPacks.pink,
                        child: Text('New'),
                      ),
                      SizedBox(width: 128),
                      BFButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (context) => Center(
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 8,
                                ),
                              ),
                            ),
                          );
                          String? path = await getDirectoryPath();
                          if (context.mounted) {
                            context.pop();
                          }
                          if (path == null) {
                            print('Nothing Selected');
                          } else {
                            if (context.mounted) {
                              context.read<FileSource>().open(path);
                            }
                          }
                        },
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
