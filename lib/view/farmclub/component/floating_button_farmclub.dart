import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/community/post/post_screen.dart';

class FloatingButtonFarmclub extends StatelessWidget {
  const FloatingButtonFarmclub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {},
      child: SizedBox(
        width: 80,
        height: 60,
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PostScreen();
                },
              ),
            );
          },
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
          child: Center(
            child: SvgPicture.asset(
              "assets/image/ic_edit.svg",
              color: FarmusThemeData.white,
              height: 32,
              width: 32,
            ),
          ),
        ),
      ),
    );
  }
}
