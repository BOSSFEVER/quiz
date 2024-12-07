import 'package:flutter/material.dart';
import 'package:bf_theme/bf_theme.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KeyWidget(label: 'Shorthand'),
        KeyWidget(label: 'Question'),
        KeyWidget(label: 'Answer'),
        KeyWidget(label: 'Extra Information'),
      ],
    );
  }
}

class KeyWidget extends StatelessWidget {
  const KeyWidget({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
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
                  label,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.bodyLarge,
                ),
              ),
            ),
            Expanded(
              child: TextField(
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
