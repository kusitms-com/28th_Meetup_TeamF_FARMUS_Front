import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_button.dart';

class ButtonWhite extends StatelessWidget {
  final String text;
  const ButtonWhite({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: text,
      onPressed: () {},
      backgroundColor: FarmusThemeData.white,
      foregroundColor: FarmusThemeData.brownButton,
      surfaceTintColor: FarmusThemeData.brownButton,
    );
  }
}
