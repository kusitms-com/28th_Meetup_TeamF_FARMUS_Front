import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/model/farmclub_detail.dart';
import 'package:mojacknong_android/view/farmclub/component/around/farmclub_around_record.dart';
import 'package:mojacknong_android/view/farmclub/component/around/farmclub_around_title.dart';
import 'package:mojacknong_android/view/farmclub/component/around/farmclub_around_vegetable.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_help.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_init.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_picture.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_content.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_title_with_divider.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub_info.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_detail_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_join_controller.dart';

import '../../view_model/controllers/crop/crop_info_step_controller.dart';
import '../../view_model/controllers/farmclub/farmclub_controller.dart';
import 'farmclub_help_screen.dart';

class FarmclubDetailScreen extends StatefulWidget {
  final int id;
  final String title;

  FarmclubDetailScreen({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);

  @override
  State<FarmclubDetailScreen> createState() =>
      _FarmclubDetailScreenScreenState();
}

class _FarmclubDetailScreenScreenState extends State<FarmclubDetailScreen> {
  BottomSheetController _bottomSheetController = BottomSheetController();
  FarmclubDetailController _detailController =
      Get.put(FarmclubDetailController());
  FarmclubJoinController _joinController = Get.put(FarmclubJoinController());
  CropInfoStepController _cropInfoStepController =
      Get.put(CropInfoStepController());
  FarmclubController _farmclubController = Get.find();


  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _detailController.getFarmclubDetail(widget.id.toInt());
    await _joinController.getVeggieRegistration(_detailController.veggieInfoId.value);
    _cropInfoStepController.veggieInfoId.value =
        _detailController.farmclubInfo.value!.veggieInfoId.toString();
    _cropInfoStepController.stepNum.value =
        _detailController.farmclubInfo.value!.stepNum.toInt();
    await _cropInfoStepController.getCropInfoStep();
    _joinController.challengeId = _detailController.joinChallengeId;
    print("챌린지 아이디 !!! ${_detailController.joinChallengeId}");
  }

  @override
  void dispose() {
    _detailController.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "둘러보기",
      ),
      backgroundColor: FarmusThemeData.white,
      body: Obx(() {
        if (_detailController.isLoading.value) {
          // 로딩 중일 때 표시할 UI
          return Center(
            child: CircularProgressIndicator(
              color: FarmusThemeData.brown,
            ),
          );
        } else {
          // 로딩이 완료된 경우 표시할 UI
          if (_detailController.farmclubInfo.value != null) {
            return buildFarmclubDetailUI(_detailController.farmclubInfo.value!);
          } else {
            // 데이터가 없는 경우 표시할 UI
            return Center(
              child: Text('데이터가 없습니다'),
            );
          }
        }
      }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(8.0),
        child: ButtonBrown(
          text: "팜클럽 가입하기",
          enabled: RxBool(true),
          onPress: () async {
            await _joinController.getVeggieRegistration(_detailController.veggieInfoId.toString());
            _bottomSheetController.showFarmclubJoinBottomSheet(
                context, widget.title);
          },
        ),
      ),
    );
  }

  Widget buildFarmclubDetailUI(FarmclubDetail farmclubInfo) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FarmclubAroundTitle(
                  title: farmclubInfo.challengeName,
                ),
                FarmclubAroundVegetable(
                  vegetableImage: farmclubInfo.veggieImage,
                  vegetable: farmclubInfo.veggieName,
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    _bottomSheetController.showMissionFinishDialog(context, "title");
                  },
                  child: FarmclubContent(
                    content: farmclubInfo.challengeDescription,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                MyFarmclubInfo(
                  level: farmclubInfo.difficulty,
                  now: farmclubInfo.currentUser.toString(),
                  max: farmclubInfo.maxUser.toString(),
                  status: farmclubInfo.status.toString(),
                ),
                SizedBox(
                  height: 16,
                ),
                Divider(
                  thickness: 12,
                  color: FarmusThemeData.dividerBackground,
                ),
                SizedBox(
                  height: 12,
                ),
                FarmclubTitleWithDivider(title: "함께 도전해요"),
                farmclubInfo.stepImages != null
                    ? ChallengeStep(
                        step: farmclubInfo.stepNum,
                        title: farmclubInfo.stepName,
                      )
                    : ChallengeInit(),
                SizedBox(
                  height: 16,
                ),
                ChallengeHelp(
                  help: farmclubInfo.stepTip,
                  veggieInfoId: farmclubInfo.veggieInfoId,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FarmclubHelpScreen(
                            veggieInfoId: farmclubInfo.veggieInfoId,
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                farmclubInfo.stepImages.isNotEmpty
                    ? ChallengePicture()
                    : Center(child: ChallengeInit()),
                SizedBox(
                  height: 16,
                ),
                Divider(
                  thickness: 12,
                  color: FarmusThemeData.dividerBackground,
                ),
                SizedBox(
                  height: 12,
                ),
                FarmclubTitleWithDivider(title: "함께 기록해요"),
                FarmclubAroundRecord(),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
