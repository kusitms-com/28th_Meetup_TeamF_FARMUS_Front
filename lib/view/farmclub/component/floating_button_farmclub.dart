import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_make_screen.dart';

class FloatingButtonFarmclub extends StatelessWidget {
  const FloatingButtonFarmclub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {},
      child: SizedBox(
        width: 75,
        height: 45,
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FarmclubMakeScreen();
            }));
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
              "assets/image/ic_plus.svg",
              color: FarmusThemeData.white,
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
    );
  }
}
