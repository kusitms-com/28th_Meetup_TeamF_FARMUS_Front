import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/model/farmclub_detail.dart';
import 'package:mojacknong_android/view/farmclub/component/around/farmclub_around_record.dart';
import 'package:mojacknong_android/view/farmclub/component/around/farmclub_around_title.dart';
import 'package:mojacknong_android/view/farmclub/component/around/farmclub_around_vegetable.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_feed.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_help.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_content.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_title_with_divider.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub_info.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_detail_controller.dart';

class FarmclubDetailScreen extends StatefulWidget {
  final int id;
  final String title;

  FarmclubDetailScreen({
    super.key,
    required this.id,
    required this.title,
  });

  @override
  State<FarmclubDetailScreen> createState() =>
      _FarmclubDetailScreenScreenState();
}

class _FarmclubDetailScreenScreenState extends State<FarmclubDetailScreen> {
  BottomSheetController _bottomSheetController = BottomSheetController();
  FarmclubDetailController _detailController =
      Get.put(FarmclubDetailController());

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
              child: Text('No data available'),
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
          onPress: () {
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
                FarmclubContent(
                  content: farmclubInfo.challengeDescription,
                ),
                SizedBox(
                  height: 8,
                ),
                MyFarmclubInfo(),
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
                ChallengeStep(
                  step: farmclubInfo.stepNum.toString(),
                  title: farmclubInfo.stepName,
                ),
                SizedBox(
                  height: 16,
                ),
                ChallengeHelp(
                  help: farmclubInfo.stepTip,
                ),
                SizedBox(
                  height: 16,
                ),
                ChallengeFeed(),
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
