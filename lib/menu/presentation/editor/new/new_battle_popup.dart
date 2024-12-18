import 'dart:io';

import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/core/routing/routes.dart';
import 'package:file_selector/file_selector.dart';
import 'package:quiz/menu/presentation/editor/new/bloc/new_battle_cubit.dart';

class NewBattlePopup extends StatelessWidget {
  const NewBattlePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewBattleCubit(),
      child: Transform.scale(
        scale: 1.2,
        child: Dialog(
          backgroundColor: BFColors.background,
          child: SizedBox(
            width: 700,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: BlocBuilder<NewBattleCubit, NewBattleState>(builder: (context, state) {
                return Column(
                  children: [
                    Text('Create a New Battle', style: context.theme.textTheme.headlineSmall),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Text('Save Under ...', style: context.theme.textTheme.bodyLarge),
                        Spacer(),
                        BFButton(
                          colorPack: BFColorPacks.orange,
                          trailing: Icons.open_in_new,
                          onPressed: state.loading
                              ? null
                              : () async {
                                  if (context.mounted) {
                                    NewBattleCubit cubit = context.read<NewBattleCubit>();
                                    cubit.setLoading();
                                    final path = await getDirectoryPath();
                                    cubit.setPath(path);
                                  }
                                },
                          child: Text('Choose Location'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: state.loading
                          ? SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.grey,
                                backgroundColor: Colors.transparent,
                              ),
                            )
                          : Text(
                              state.path == ''
                                  ? 'no path provided'
                                  : state.name == ''
                                      ? state.path
                                      : '${state.path}${Platform.pathSeparator}${state.name}',
                              style: context.theme.textTheme.bodyLarge!.copyWith(color: Colors.grey),
                            ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text('Name', style: context.theme.textTheme.bodyLarge),
                        SizedBox(width: 16),
                        Expanded(
                          child: BFTextField(
                            maxLines: 1,
                            fillColor: BFColors.widgetBackground,
                            colorPack: BFColorPacks.cyan,
                            onChanged: context.read<NewBattleCubit>().setName,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        BFButton(
                          colorPack: BFColorPacks.red,
                          onPressed: state.loading ? null : () => context.pop(),
                          leading: Icons.close,
                          child: Text('Cancel'),
                        ),
                        Spacer(),
                        BFButton(
                          colorPack: BFColorPacks.green,
                          onPressed: state.loading || state.name == '' || state.path == ''
                              ? null
                              : () => context.pushReplacementNamed(Routes.battleEditor),
                          leading: Icons.check,
                          child: Text('Create'),
                        ),
                      ],
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
