import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/button_brown.dart';
import 'package:mojacknong_android/view/farmclub/component/button_white.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_feed.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_help.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_content.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_init.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_title.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_title_with_divider.dart';
import 'package:mojacknong_android/view/farmclub/component/group/group_rate.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub_info.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub_list.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_picture.dart';
import 'package:mojacknong_android/view/farmclub/component/record/record_profile.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_auth_screen.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_challenge_screen.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_explore_screen.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_record_screen.dart';
import 'package:mojacknong_android/view/farmclub/my_farmclub_mission_screen.dart';
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
                const Text(
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
                            return const FarmclubExploreScreen();
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
                        const SizedBox(
                          height: 8,
                        ),
                        MyFarmclubList(),
                        const SizedBox(
                          height: 16,
                        ),
                        const FarmclubTitle(),
                        const SizedBox(
                          height: 8,
                        ),
                        const FarmclubContent(
                            content:
                                "상추를 치료해줄 사람 어디 없나. 저만 매번 실패하나요..\n이번에는 꼭 성공해서 얼른 상추쌈 싸먹어봐요!"),
                        const MyFarmclubInfo(),
                        const SizedBox(
                          height: 8,
                        ),
                        const GroupRate(),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(
                          thickness: 12,
                          color: FarmusThemeData.dividerBackground,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const FarmclubTitleWithDivider(title: "함께 도전해요"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const FarmclubChallengeScreen(detailId: '',);
                                },
                              ),
                            );
                          },
                          child: const ChallengeStep(
                            step: 0,
                            title: "준비물을 챙겨요",
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ChallengeHelp(
                          help: "상추 씨앗과 상토, 재배 용기를 준비해 주세요",
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const FarmclubChallengeScreen(detailId: '',);
                                  },
                                ),
                              );
                            },
                            child: const ChallengeFeed(detailId: '',)),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(
                          thickness: 12,
                          color: FarmusThemeData.dividerBackground,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const FarmclubTitleWithDivider(title: "함께 기록해요"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return FarmclubRecordScreen();
                                },
                              ),
                            );
                          },
                          child: const RecordProfile(
                            nickname: "파머",
                            postTime: "10/29 4:12",
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return FarmclubRecordScreen();
                                },
                              ),
                            );
                          },
                          child: RecordPicture(
                            like: controller.like,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return FarmclubRecordScreen();
                                },
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~",
                              style: FarmusThemeData.darkStyle14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
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
                                return const MyFarmclubMissionScreen(detailId: '',);
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
            )
          : null,
    );
  }
}
