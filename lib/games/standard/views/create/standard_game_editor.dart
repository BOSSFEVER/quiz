import 'package:flutter/material.dart';
import 'package:bf_theme/bf_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/games/standard/domain/entities/standard_round_entity.dart';
import 'package:quiz/games/standard/views/create/standard_game_cubit.dart';

class StandardGameEditor extends StatelessWidget {
  const StandardGameEditor({super.key, required this.round, required this.index});

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
          EditorField(label: 'Shorthand', initialValue: round.shorthand, onUpdate: (string) => cubit.updateShorthand(string)),
          EditorField(label: 'Question', initialValue: round.question, onUpdate: (string) => cubit.updateQuestion(string)),
          EditorField(label: 'Answer', initialValue: round.answer, onUpdate: (string) => cubit.updateAnswer(string)),
          EditorField(label: 'Extra Information', initialValue: round.extra, onUpdate: (string) => cubit.updateExtra(string)),
        ],
      ),
    );
  }
}

class EditorField extends StatefulWidget {
  const EditorField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onUpdate,
  });

  final String label;
  final String initialValue;
  final void Function(String) onUpdate;

  @override
  State<EditorField> createState() => _EditorFieldState();
}

class _EditorFieldState extends State<EditorField> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.text = widget.initialValue;
    return Card(
      color: BFColors.widgetBackground,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.bodyLarge,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: widget.onUpdate,
                cursorColor: BFColorPacks.cyan.background,
                cursorWidth: 2,
                decoration: InputDecoration(
                  fillColor: BFColors.background,
                  filled: true,
                  focusColor: Colors.red,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      style: BorderStyle.solid,
                      color: BFColorPacks.cyan.background,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      style: BorderStyle.solid,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                minLines: 1,
                maxLines: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
