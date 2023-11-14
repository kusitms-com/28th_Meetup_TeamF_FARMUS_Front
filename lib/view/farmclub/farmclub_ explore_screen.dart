import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/brown_category.dart';
import 'package:mojacknong_android/view/farmclub/component/button_to_search.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub.dart';
import 'package:mojacknong_android/view/farmclub/component/floating_button_farmclub.dart';
import 'package:mojacknong_android/view/farmclub/component/recommend_farmclub_list.dart';
import 'package:mojacknong_android/view/farmclub/component/search_category.dart';

class FarmclubExploreScreen extends StatelessWidget {
  const FarmclubExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(width: 48),
                Expanded(
                  child: ButtonToSearch(),
                ),
                SizedBox(width: 16),
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
          const SizedBox(height: 16),
          Row(
            children: const [
              SizedBox(width: 16),
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
          const SizedBox(height: 12),
          RecommendFarmclubList(),
          const SizedBox(height: 40),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "팜클럽 모아보기",
                    style: TextStyle(
                      color: FarmusThemeData.dark,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Pretendard",
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    SearchCategory(
                        title: "재배 난이도",
                        categories: ["Easy", "Normal", "Hard"]),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    SearchCategory(
                        title: "팜클럽 상태", categories: ["준비 중", "진행 중"]),
                  ],
                ),
                const Divider(
                  endIndent: 16,
                  indent: 16,
                  color: FarmusThemeData.grey4,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      if (index == 6) {
                        // 마지막 아이템에 빈 컨테이너를 추가하여
                        // 플로팅 버튼이 가려지는 현상 방지
                        return Container(
                          height: 40,
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Farmclub(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const FloatingButtonFarmclub(),
    );
  }

  Widget _buildCategoryRow(String title, List<String> categories) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: const TextStyle(
            color: FarmusThemeData.grey1,
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 8),
        ...categories.map((category) => BrownCategory(category: category)),
      ],
    );
  }
}
