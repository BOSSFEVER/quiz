import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';

class RoundCard extends StatelessWidget {
  const RoundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BFButton(
      trailing: Icons.chevron_right,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      onPressed: () {},
      colorPack: BFColorPack(BFColors.widgetBackground, Color(0xFF303030), Color(0xFF404040)),
      child: Flexible(
          child: Text(
        'This is a very long Question? But I do not unfortunate the answer to it. Where are you?',
        maxLines: 1,
        softWrap: false,
        overflow: TextOverflow.fade,
      )),
    );
  }
}
