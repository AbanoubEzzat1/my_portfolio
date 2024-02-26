import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final TextStyle style;
  final void Function()? onPressed;
  const AppTextButton({
    super.key,
    required this.text,
    required this.style,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
