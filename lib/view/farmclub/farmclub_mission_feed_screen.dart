import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_help.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_help_screen.dart';

class FarmclubMissionFeedScreen extends StatefulWidget {
  const FarmclubMissionFeedScreen({super.key});

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
          SizedBox(
            height: 16,
          ),
          ChallengeStep(step: "0", title: "준비물을 챙겨요"),
          SizedBox(
            height: 16,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FarmclubHelpScreen();
                    },
                  ),
                );
              },
              child: ChallengeHelp(help: "상추를 키울 때에는 어쩌고저쩌고 해야해요.")),
        ],
      ),
    );
  }
}
