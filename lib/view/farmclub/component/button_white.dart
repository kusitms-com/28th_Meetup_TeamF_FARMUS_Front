import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_button.dart';

class ButtonWhite extends StatelessWidget {
  final String text;
  final Function()? onPress;

  const ButtonWhite({super.key, required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: text,
      onPressed: onPress,
      backgroundColor: FarmusThemeData.white,
      foregroundColor: FarmusThemeData.brownButton,
      surfaceTintColor: FarmusThemeData.brownButton,
    );
  }
}
