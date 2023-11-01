import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: null,
        child: Text("다음"),
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(FarmusThemeData.button),
          foregroundColor: MaterialStatePropertyAll(FarmusThemeData.white),
        ),
      ),
    );
  }
}
