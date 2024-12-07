import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';

class HomeScreenButton extends StatelessWidget {
  const HomeScreenButton({super.key, required this.text, required this.onPressed, required this.colors});

  final String text;
  final BFColorPack colors;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all((size.width / 50).clamp(16, double.infinity)),
      child: BFButton(
        onPressed: onPressed,
        width: (size.width / 5).clamp(300, double.infinity),
        height: (size.height / 1.7).clamp(500, double.infinity),
        colorPack: colors,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: Text(
              text,
              style: const TextStyle(fontSize: 64),
            ),
          ),
        ),
      ),
    );
  }
}
