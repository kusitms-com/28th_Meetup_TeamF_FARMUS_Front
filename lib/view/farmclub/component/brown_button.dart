import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_button.dart';

class BrownButton extends StatelessWidget {
  final String text;
  final bool enabled;

  const BrownButton({
    Key? key,
    required this.text,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PrimaryButton(
        text: text,
        backgroundColor:
            enabled ? FarmusThemeData.brownButton : FarmusThemeData.grey4,
        foregroundColor:
            enabled ? FarmusThemeData.white : FarmusThemeData.grey2,
      ),
    );
  }
}
