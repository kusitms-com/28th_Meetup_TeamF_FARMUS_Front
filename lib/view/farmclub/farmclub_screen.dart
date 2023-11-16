import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/farmclub/component/button_white.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_feed.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_title.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_content.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_init.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_title.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_title_with_divider.dart';
import 'package:mojacknong_android/view/farmclub/component/group/group_rate.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub_info.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub_list.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_picture.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_profile.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_explore_screen.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub_controller.dart';

class FarmclubScreen extends StatefulWidget {
  bool isFarmclub;

  FarmclubScreen({super.key, required this.isFarmclub});

  @override
  State<FarmclubScreen> createState() => _FarmclubScreenState();
}

class _FarmclubScreenState extends State<FarmclubScreen> {
  final FarmclubController controller = Get.put(FarmclubController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "나의 팜클럽",
                  style: TextStyle(
                    color: FarmusThemeData.dark,
                    fontFamily: "Pretendard",
                    fontSize: 16,
                  ),
                ),
                Bouncing(
                  onPress: () {},
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FarmclubExploreScreen();
                          },
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/image/ic_search.svg",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: widget.isFarmclub
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        MyFarmclubList(),
                        SizedBox(
                          height: 16,
                        ),
                        FarmclubTitle(),
                        SizedBox(
                          height: 8,
                        ),
                        FarmclubContent(
                            content:
                                "상추를 치료해줄 사람 어디 없나. 저만 매번 실패하나요..\n이번에는 꼭 성공해서 얼른 상추쌈 싸먹어봐요!"),
                        MyFarmclubInfo(),
                        SizedBox(
                          height: 8,
                        ),
                        GroupRate(),
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
                        ChallengeTitle(
                          step: "0",
                          title: "준비물을 챙겨요",
                          help: "상추 씨앗과 상토, 재배 용기를 준비해 주세요",
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
                        RecordProfile(nickname: "파머", postTime: "10/29 4:12"),
                        SizedBox(
                          height: 12,
                        ),
                        RecordPicture(
                          like: controller.like,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~",
                            style: FarmusThemeData.darkStyle14,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )
                : FarmclubInit(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: widget.isFarmclub
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ButtonWhite(
                      text: "내 미션",
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ButtonBrown(
                      text: "미션 인증하기",
                      enabled: RxBool(true),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
