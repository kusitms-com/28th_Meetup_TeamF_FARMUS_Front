import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/brown_category.dart';
import 'package:mojacknong_android/view/farmclub/component/button_to_search.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub.dart';
import 'package:mojacknong_android/view/farmclub/component/floating_button_farmclub.dart';
import 'package:mojacknong_android/view/farmclub/component/recommend_farmclub_list.dart';

class FarmclubExploreScreen extends StatefulWidget {
  const FarmclubExploreScreen({Key? key}) : super(key: key);

  @override
  State<FarmclubExploreScreen> createState() => _FarmclubExploreScreenState();
}

class _FarmclubExploreScreenState extends State<FarmclubExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        actions: const [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 48,
                ),
                Expanded(
                  child: ButtonToSearch(),
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                "파머",
                style: TextStyle(
                  color: FarmusThemeData.dark,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Pretendard",
                ),
              ),
              Text(
                " 님을 위한",
                style: TextStyle(
                  color: FarmusThemeData.dark,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Pretendard",
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "추천 팜클럽",
              style: TextStyle(
                color: FarmusThemeData.dark,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "Pretendard",
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          RecommendFarmclubList(),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "팜클럽 모아보기",
                  style: TextStyle(
                    color: FarmusThemeData.dark,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Pretendard",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "재배 난이도",
                      style: TextStyle(
                        color: FarmusThemeData.grey1,
                        fontFamily: "Pretendard",
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    BrownCategory(category: "Easy"),
                    BrownCategory(category: "Normal"),
                    BrownCategory(category: "Hard"),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "팜클럽 상태",
                      style: TextStyle(
                        color: FarmusThemeData.grey1,
                        fontFamily: "Pretendard",
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    BrownCategory(category: "준비 중"),
                    BrownCategory(category: "진행 중"),
                  ],
                ),
                Divider(
                  color: FarmusThemeData.grey4,
                ),
                Farmclub(),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: const FloatingButtonFarmclub(),
    );
  }
}
