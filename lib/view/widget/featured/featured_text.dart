import 'package:flutter/material.dart';

class FeaturedText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const FeaturedText({
    super.key,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
