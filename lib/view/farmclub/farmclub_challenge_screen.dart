import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/farmclub/component/button_white.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_feed.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_help.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_title_with_divider.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_auth_screen.dart';
import 'package:mojacknong_android/view/farmclub/my_farmclub_mission_screen.dart';

class FarmclubChallengeScreen extends StatefulWidget {
  const FarmclubChallengeScreen({Key? key}) : super(key: key);

  @override
  State<FarmclubChallengeScreen> createState() =>
      _FarmclubChallengeScreenState();
}

class _FarmclubChallengeScreenState extends State<FarmclubChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> challengeSteps = [
      {"step": "0", "title": "준비물을 챙겨요"},
      {"step": "1", "title": "상추를 심어요"},
      {"step": "2", "title": "새싹이 자라나요"},
      {"step": "3", "title": "새싹이 자라나요"},
      {"step": "4", "title": "새싹이 자라나요"},
    ];

    return Scaffold(
      appBar: PrimaryAppBar(title: "함께 도전해요"),
      backgroundColor: FarmusThemeData.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FarmclubTitleWithDivider(title: "완료한 Step"),
            Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Text(
                  "아직 완료한 Step이 없어요",
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            FarmclubTitleWithDivider(title: "현재 Step"),
            ChallengeStep(
              step: "0",
              title: "준비물을 챙겨요",
            ),
            SizedBox(
              height: 16,
            ),
            ChallengeHelp(
              help: "상추 씨앗과 상토, 재배 용기를 준비해 주세요",
            ),
            SizedBox(
              height: 16,
            ),
            ChallengeFeed(),
            SizedBox(
              height: 16,
            ),
            FarmclubTitleWithDivider(title: "다음 Step"),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: challengeSteps.length - 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ChallengeStep(
                      step: challengeSteps[index + 1]["step"]!,
                      title: challengeSteps[index + 1]["title"]!,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      endIndent: 16,
                      indent: 16,
                      color: FarmusThemeData.grey4,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.all(8),
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
                          return MyFarmclubMissionScreen();
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FarmclubAuthScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
