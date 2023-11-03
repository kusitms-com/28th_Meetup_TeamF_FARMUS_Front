import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_button.dart';

class NextButton extends StatelessWidget {
  final void Function() onPressed;

  const NextButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PrimaryButton(
        text: '다음',
        onPressed: onPressed,
        backgroundColor: FarmusThemeData.button,
        foregroundColor: FarmusThemeData.white,
      ),
    );
  }
}
