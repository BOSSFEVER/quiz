import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';

class LabeledEditorField extends StatefulWidget {
  const LabeledEditorField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onUpdate,
  });

  final String label;
  final String initialValue;
  final void Function(String) onUpdate;

  @override
  State<LabeledEditorField> createState() => _LabeledEditorFieldState();
}

class _LabeledEditorFieldState extends State<LabeledEditorField> {
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
              child: BFTextField(
                controller: controller,
                onChanged: widget.onUpdate,
                colorPack: BFColorPacks.cyan,
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
