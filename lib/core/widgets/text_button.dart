import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theming/colors.dart';

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
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(ColorsManager.lightBlue),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
