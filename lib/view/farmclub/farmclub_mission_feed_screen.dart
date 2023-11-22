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
import 'package:mojacknong_android/view/my_page/my_farmclub_history_screen.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_mission_controller.dart';

class FarmclubMissionFeedScreen extends StatefulWidget {
  final String? registrationId;
  final int challengeId;
  final int stepNum;

  const FarmclubMissionFeedScreen({
    super.key,
    this.registrationId,
    required this.challengeId,
    required this.stepNum,
  });

  @override
  State<FarmclubMissionFeedScreen> createState() =>
      _FarmclubMissionFeedScreenState();
}

class _FarmclubMissionFeedScreenState extends State<FarmclubMissionFeedScreen> {
  FarmclubMissionController _farmclubMissionController =
      Get.put(FarmclubMissionController());
  FarmclubController _controller = Get.find();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      await _farmclubMissionController.getFarmclubRecommend(
        widget.challengeId,
        widget.stepNum,
      );
    } catch (error) {
      // 오류 처리 로직 추가
      print('Error fetching farmclub mission data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Obx(() {
        if (_farmclubMissionController.farmclubMissionList.isEmpty) {
          // 로딩 페이지 표시
          return Center(
            child: CircularProgressIndicator(
              color: FarmusThemeData.brown,
            ),
          );
        } else {
          // 응답이 왔을 때 화면 빌드
          return Column(
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
                      ChallengeStep(
                          step: widget.stepNum.toInt(),
                          title: _controller.farmclubInfo.value!.stepName),
                      SizedBox(
                        height: 16,
                      ),
                      ChallengeHelp(
                        help: _controller.farmclubInfo.value!.stepTip,
                        veggieInfoId:
                            _controller.farmclubInfo.value!.veggieInfoId,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: _farmclubMissionController
                              .farmclubMissionList
                              .map((mission) => MissionFeed(mission: mission))
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }),
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
                          return MyFarmclubMissionScreen(challengeID: 4);
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
                onPress: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
