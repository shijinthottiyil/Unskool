import 'package:flutter/material.dart';

class WidgetRow extends StatelessWidget {
  final List<Widget> listWidget;
  const WidgetRow({
    super.key,
    required this.listWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: listWidget,
    );
  }
}
