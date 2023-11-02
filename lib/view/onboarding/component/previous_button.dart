import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_button.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: "이전",
      onPressed: () {},
      backgroundColor: FarmusThemeData.grey2,
      foregroundColor: FarmusThemeData.black,
    );
  }
}
