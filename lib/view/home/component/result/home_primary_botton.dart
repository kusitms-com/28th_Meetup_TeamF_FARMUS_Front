import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/result/custom_button.dart';

class HomePrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool enabled;

  const HomePrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomBotton(
        text: text,
        onPressed: enabled ? onPressed : null,
        backgroundColor:
            enabled ? FarmusThemeData.brownButton : FarmusThemeData.grey4,
        foregroundColor:
            enabled ? FarmusThemeData.white : FarmusThemeData.grey2,
      ),
    );
  }
}
