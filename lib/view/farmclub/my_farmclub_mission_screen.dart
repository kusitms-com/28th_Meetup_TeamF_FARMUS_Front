import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_picture.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';

class MyFarmclubMissionScreen extends StatefulWidget {
  const MyFarmclubMissionScreen({super.key});

  @override
  State<MyFarmclubMissionScreen> createState() =>
      _MyFarmclubMissionScreenState();
}

class _MyFarmclubMissionScreenState extends State<MyFarmclubMissionScreen> {
  final FarmclubController farmclubController = Get.put(FarmclubController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "내 미션",
      ),
      backgroundColor: FarmusThemeData.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ChallengeStep(
                  step: "0",
                  title: "상훈이 씨앗 심고 사진 찍기",
                ),
                Spacer(),
                Text(
                  "10/29 4:12",
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
            RecordPicture(
              like: 1.obs,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~",
                style: FarmusThemeData.darkStyle14,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ChallengeStep(
                  step: "1",
                  title: "상훈이 씨앗 심고 사진 찍기",
                ),
                Spacer(),
                Text(
                  "10/29 4:12",
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
            RecordPicture(
              like: 1.obs,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~",
                style: FarmusThemeData.darkStyle14,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ChallengeStep(
                  step: "2",
                  title: "상훈이 씨앗 심고 사진 찍기",
                ),
                Spacer(),
                Text(
                  "10/29 4:12",
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
            RecordPicture(
              like: 1.obs,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~",
                style: FarmusThemeData.darkStyle14,
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
