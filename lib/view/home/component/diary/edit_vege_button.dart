import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class EditButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? surfaceTintColor;

  const EditButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor = FarmusThemeData.brownButton,
    this.foregroundColor = FarmusThemeData.brownButton,
    this.surfaceTintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 220,
          height: 48,
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              foregroundColor: MaterialStateProperty.all(foregroundColor),
              side: MaterialStateProperty.resolveWith(
                (states) {
                  return BorderSide(
                    color: surfaceTintColor != null
                        ? surfaceTintColor!
                        : FarmusThemeData.brownButton,
                    width: 1.0,
                  );
                },
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
