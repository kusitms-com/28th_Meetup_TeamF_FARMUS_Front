import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_button.dart';

class ButtonBrown extends StatelessWidget {
  final String text;
  final RxBool enabled;
  final Function()? onPress;

  const ButtonBrown({
    Key? key,
    required this.text,
    required this.enabled,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Bouncing(
        onPress: enabled.value ? onPress : null,
        child: GestureDetector(
          onTap: () {
            if (onPress != null && enabled.value) {
              onPress!();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: PrimaryButton(
              text: text,
              backgroundColor: enabled.value
                  ? FarmusThemeData.brownButton
                  : FarmusThemeData.grey4,
              foregroundColor:
                  enabled.value ? FarmusThemeData.white : FarmusThemeData.grey2,
            ),
          ),
        ),
      );
    });
  }
}
