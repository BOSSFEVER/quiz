import 'package:flutter/material.dart';
import 'package:bf_theme/bf_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/games/standard/domain/entities/standard_round_entity.dart';
import 'package:quiz/games/standard/views/editor/bloc/standard_game_editor_cubit.dart';
import 'package:quiz/global/presentation/widgets/labeled_editor_field.dart';

class EditGameSubView extends StatelessWidget {
  const EditGameSubView({super.key, required this.round, required this.index});

  final StandardRoundEntity round;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StandardGameEditorCubit>();
    return DefaultSelectionStyle.merge(
      selectionColor: BFColorPacks.cyan.background.withOpacity(0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabeledEditorField(label: 'Shorthand', initialValue: round.shorthand, onUpdate: (string) => cubit.updateShorthand(string)),
          LabeledEditorField(label: 'Question', initialValue: round.question, onUpdate: (string) => cubit.updateQuestion(string)),
          LabeledEditorField(label: 'Answer', initialValue: round.answer, onUpdate: (string) => cubit.updateAnswer(string)),
          LabeledEditorField(label: 'Extra Information', initialValue: round.extra, onUpdate: (string) => cubit.updateExtra(string)),
        ],
      ),
    );
  }
}
