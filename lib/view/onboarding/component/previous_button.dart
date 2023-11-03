import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_button.dart';

class PreviousButton extends StatelessWidget {
  final void Function() onPressed;

  const PreviousButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: '이전',
      onPressed: onPressed,
      backgroundColor: FarmusThemeData.grey2,
      foregroundColor: FarmusThemeData.black,
    );
  }
}
