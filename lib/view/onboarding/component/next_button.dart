import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_button.dart';

class NextButton extends StatelessWidget {
  final void Function() onPressed;
  // 텍스트 입력 값 여부
  final bool enabled;

  const NextButton({
    Key? key,
    required this.onPressed,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PrimaryButton(
        text: '다음',
        onPressed: enabled ? onPressed : null,
        backgroundColor:
            enabled ? FarmusThemeData.brownButton : FarmusThemeData.grey4,
        foregroundColor:
            enabled ? FarmusThemeData.white : FarmusThemeData.grey2,
      ),
    );
  }
}
