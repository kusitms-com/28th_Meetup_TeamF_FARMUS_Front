import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/farmclub/component/button_white.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_help.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_picture.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_title_with_divider.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_auth_screen.dart';
import 'package:mojacknong_android/view/farmclub/my_farmclub_mission_screen.dart';
import 'package:mojacknong_android/view/my_page/my_farmclub_history_screen.dart';
import 'package:mojacknong_android/view_model/controllers/crop/crop_info_step_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_auth_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';

class FarmclubChallengeScreen extends StatefulWidget {
  final String? detailId;

  const FarmclubChallengeScreen({Key? key, required this.detailId})
      : super(key: key);

  @override
  State<FarmclubChallengeScreen> createState() =>
      _FarmclubChallengeScreenState();
}

class _FarmclubChallengeScreenState extends State<FarmclubChallengeScreen> {
  FarmclubController _farmclubController = Get.find();
  FarmclubAuthController _authController = Get.find();
  CropInfoStepController _cropInfoStepController =
      Get.put(CropInfoStepController());

  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    _cropInfoStepController.veggieInfoid.value =
        _farmclubController.farmclubInfo.value!.veggieInfoId.toString();
    _cropInfoStepController.stepNum.value =
        _farmclubController.farmclubInfo.value!.stepNum.toInt();
    await _cropInfoStepController.getCropInfoStep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "함께 도전해요"),
      backgroundColor: FarmusThemeData.white,
      body: Obx(() {
        if (_cropInfoStepController.cropInfoStep.isEmpty) {
          return CircularProgressIndicator(color: FarmusThemeData.brown);
        } else {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FarmclubTitleWithDivider(title: "완료한 Step"),
                const Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "아직 완료한 Step이 없어요",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const FarmclubTitleWithDivider(title: "현재 Step"),
                const ChallengeStep(
                  step: 0,
                  title: "준비물을 챙겨요",
                ),
                const SizedBox(
                  height: 16,
                ),
                const ChallengeHelp(
                  help: "상추 씨앗과 상토, 재배 용기를 준비해 주세요",
                ),
                const SizedBox(
                  height: 16,
                ),
                const ChallengePicture(),
                const SizedBox(
                  height: 16,
                ),
                const FarmclubTitleWithDivider(title: "다음 Step"),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ChallengeStep(
                          step: index,
                          title: index.toString(),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(
                          endIndent: 16,
                          indent: 16,
                          color: FarmusThemeData.grey4,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        }
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8),
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
                            challengeID: 4,
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
                onPress: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FarmclubAuthScreen(
                        farmclubData: _farmclubController.myFarmclubState,
                      ),
                    ),
                  );
                  // 업로드 성공 후 새로고침
                  if (_authController.missionUploaded.value) {
                    _authController.missionUploaded.value = false; // 초기화
                    loadFarmclubData(); // FarmclubScreen 새로고침
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadFarmclubData() async {
    await _farmclubController.getMyFarmclub();
    setState(() {});
  }
}
