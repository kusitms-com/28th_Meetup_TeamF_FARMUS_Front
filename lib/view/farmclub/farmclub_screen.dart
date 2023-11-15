import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_feed.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_title.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_title.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_title_with_divider.dart';
import 'package:mojacknong_android/view/farmclub/component/group/group_rate.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub_info.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub_list.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_explore_screen.dart';

class FarmclubScreen extends StatefulWidget {
  @override
  State<FarmclubScreen> createState() => _FarmclubScreenState();
}

class _FarmclubScreenState extends State<FarmclubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
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
            SizedBox(
              height: 8,
            ),
            MyFarmclubList(),
            SizedBox(
              height: 16,
            ),
            FarmclubTitle(),
            SizedBox(
              height: 16,
            ),
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
                help: "상추 씨앗과 상토, 재배 용기를 준비해 주세요"),
            SizedBox(
              height: 16,
            ),
            ChallengeFeed(),
            FarmclubTitleWithDivider(title: "함께 기록해요"),
          ],
        ),
      ),
    );
  }
}
