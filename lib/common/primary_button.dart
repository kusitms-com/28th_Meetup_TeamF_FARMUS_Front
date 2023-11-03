import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? surfaceTintColor;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.surfaceTintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          foregroundColor: MaterialStateProperty.all(foregroundColor),
          surfaceTintColor: MaterialStateProperty.all(surfaceTintColor),
        ),
      ),
    );
  }
}
