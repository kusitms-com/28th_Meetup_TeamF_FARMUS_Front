import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_etc_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_mission_controller.dart';

import '../../repository/mypage_repository.dart';
import '../community/component/community_picture.dart';

class MyFarmclubMissionScreen extends StatefulWidget {
  final int challengeID;

  const MyFarmclubMissionScreen({super.key, required this.challengeID});

  @override
  State<MyFarmclubMissionScreen> createState() =>
      _MyFarmclubMissionScreenState();
}

class _MyFarmclubMissionScreenState extends State<MyFarmclubMissionScreen> {
  FarmclubMissionController _farmclubMissionController =
      Get.put(FarmclubMissionController());
  FarmclubController _farmclubController = Get.put(FarmclubController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "내 미션",
      ),
      backgroundColor: FarmusThemeData.white,
      body: FutureBuilder(
        future: _farmclubMissionController.getFarmclubMyMission(
            _farmclubController
                .myFarmclubState[
                    _farmclubController.selectedFarmclubIndex.toInt()]
                .challengeId
                .toInt()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: FarmusThemeData.brown,
              ),
            );
          } else if (snapshot.hasError) {
            // 에러가 발생한 경우
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0, // 아이템 개수
              itemBuilder: (context, index) {
                final mission = snapshot.data![index]; // 현재 인덱스의 미션 데이터

                return Column(
                  children: [
                    Row(
                      children: [
                        ChallengeStep(
                          step: mission.stepNum,
                          title: mission.stepName,
                        ),
                        Spacer(),
                        Text(
                          "${mission.date}",
                          style: FarmusThemeData.grey2Style13,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CommunityPicture(image: mission.image),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "${mission.content}",
                            style: FarmusThemeData.darkStyle14,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
