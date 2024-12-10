import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/games/standard/views/create/standard_game_cubit.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key, required this.title, required this.index});

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StandardGameEditorCubit>();
    return BFButton(
      trailing: Icons.chevron_right,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      onPressed: () => cubit.setIndex(index),
      colorPack:
          cubit.state.index == index ? BFColorPacks.cyan : BFColorPack(BFColors.widgetBackground, Color(0xFF303030), Color(0xFF404040)),
      child: Flexible(
        child: Text(
          title.replaceAll('\n', ' '),
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }
}
