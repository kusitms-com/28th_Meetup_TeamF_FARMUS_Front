import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class FloatingButtonPost extends StatelessWidget {
  const FloatingButtonPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {},
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            FarmusThemeData.brownButton,
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const CircleBorder(),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: FarmusThemeData.white.withOpacity(0.3),
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            "assets/image/ic_edit.svg",
            color: FarmusThemeData.white,
          ),
        ),
      ),
    );
  }
}
