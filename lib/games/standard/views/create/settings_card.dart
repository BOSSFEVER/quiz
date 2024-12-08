import 'package:flutter/material.dart';
import 'package:bf_theme/bf_theme.dart';
import 'package:quiz/games/standard/domain/entities/standard_round_entity.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key, required this.round, required this.index});

  final StandardRoundEntity round;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KeyWidget(label: 'Shorthand', initialValue: round.shorthand),
        KeyWidget(label: 'Question', initialValue: round.question),
        KeyWidget(label: 'Answer', initialValue: round.answer),
        KeyWidget(label: 'Extra Information', initialValue: round.extra),
      ],
    );
  }
}

class KeyWidget extends StatefulWidget {
  const KeyWidget({
    super.key,
    required this.label,
    required this.initialValue,
  });

  final String label;
  final String initialValue;

  @override
  State<KeyWidget> createState() => _KeyWidgetState();
}

class _KeyWidgetState extends State<KeyWidget> {
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
                cursorColor: BFColorPacks.cyan.background,
                cursorWidth: 2,
                decoration: InputDecoration(
                  fillColor: BFColors.background,
                  filled: true,
                  focusColor: Colors.deepOrangeAccent,
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
