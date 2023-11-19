import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
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

class FarmclubAroundScreen extends StatefulWidget {
  final String title;

  FarmclubAroundScreen({
    super.key,
    required this.title,
  });

  @override
  State<FarmclubAroundScreen> createState() => _FarmclubAroundScreenState();
}

class _FarmclubAroundScreenState extends State<FarmclubAroundScreen> {
  BottomSheetController _bottomSheetController = BottomSheetController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "둘러보기",
      ),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FarmclubAroundTitle(
                    title: widget.title,
                  ),
                  FarmclubAroundVegetable(
                    vegetableImage: "assets/image/image_farmclub_blue.png",
                    vegetable: "상추",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  FarmclubContent(
                      content:
                          "상추를 치료해줄 사람 어디 없나. 저만 매번 실패하나요..\n이번에는 꼭 성공해서 얼른 상추쌈 싸먹어봐요!"),
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
                    step: 0,
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
                  ChallengeFeed(detailId: '',),
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
      ),
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
}
