import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  final double? indent;
  final double? endIndent;

  const CustomDivider({
    super.key,
    this.color = Colors.grey,
    this.thickness = 0.5,
    this.indent,
    this.endIndent,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Divider(
        color: color,
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
      ),
    );
  }
}
