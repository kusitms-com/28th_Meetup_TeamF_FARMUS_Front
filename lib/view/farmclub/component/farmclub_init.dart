import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/brown_button.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_%20explore_screen.dart';

class FarmclubInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        Column(
          children: [
            SvgPicture.asset(
              "assets/image/ic_init_farmclub.svg",
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "아직 참여한 팜클럽이 없어요",
              style: TextStyle(
                color: FarmusThemeData.grey2,
                fontFamily: "Pretendard",
                fontSize: 14,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return FarmclubExploreScreen();
              },
            ));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.0),
            child: BrownButton(
              text: "탐색하기",
              enabled: true,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
