import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/farmclub/component/button_white.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_help.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view/farmclub/component/mission_feed.dart';
import 'package:mojacknong_android/view/farmclub/my_farmclub_mission_screen.dart';

class FarmclubMissionFeedScreen extends StatefulWidget {
  final String? detailId;

  const FarmclubMissionFeedScreen({
    super.key,
    required this.detailId
  });

  @override
  State<FarmclubMissionFeedScreen> createState() =>
      _FarmclubMissionFeedScreenState();
}

class _FarmclubMissionFeedScreenState extends State<FarmclubMissionFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16,
                ),
                Text(
                  "미션 피드",
                  style: FarmusThemeData.darkStyle16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/image/ic_close.svg"),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  ChallengeStep(step: 0, title: "준비물을 챙겨요"),
                  SizedBox(
                    height: 16,
                  ),
                  ChallengeHelp(help: "상추를 키울 때에는 어쩌고저쩌고 해야해요."),
                  SizedBox(
                    height: 8,
                  ),
                  MissionFeed(),
                  MissionFeed(),
                  MissionFeed(),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ButtonWhite(
                  text: "내 미션",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyFarmclubMissionScreen(
                            detailId: widget.detailId,

                          );
                        },
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 2,
              child: ButtonBrown(
                text: "미션 인증하기",
                enabled: RxBool(true),
                onPress: () {

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
