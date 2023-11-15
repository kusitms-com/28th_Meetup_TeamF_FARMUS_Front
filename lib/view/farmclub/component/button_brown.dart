import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_button.dart';

class ButtonBrown extends StatelessWidget {
  final String text;
  final bool enabled;
  final Function? onPress;

  const ButtonBrown({
    Key? key,
    required this.text,
    required this.enabled,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: PrimaryButton(
          text: text,
          backgroundColor:
              enabled ? FarmusThemeData.brownButton : FarmusThemeData.grey4,
          foregroundColor:
              enabled ? FarmusThemeData.white : FarmusThemeData.grey2,
        ),
      ),
    );
  }
}
