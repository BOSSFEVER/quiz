import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';

class TwoSplit extends StatelessWidget {
  const TwoSplit({Key? key, required this.left, required this.right, this.width = 400}) : super(key: key);

  final Widget left;
  final Widget right;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: width,
          decoration: BoxDecoration(color: BFColors.background, boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 2,
              blurRadius: 16,
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: left,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: right,
          ),
        ),
      ],
    );
  }
}
