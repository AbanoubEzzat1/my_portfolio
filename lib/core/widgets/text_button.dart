import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final TextStyle style;
  const AppTextButton({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
