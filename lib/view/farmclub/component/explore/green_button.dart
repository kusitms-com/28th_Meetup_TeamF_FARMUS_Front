import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {},
      child: Container(
        width: 45,
        height: 30,
        decoration: BoxDecoration(
          color: FarmusThemeData.greenLight,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            "참여",
            style: FarmusThemeData.green1Style14,
          ),
        ),
      ),
    );
  }
}
