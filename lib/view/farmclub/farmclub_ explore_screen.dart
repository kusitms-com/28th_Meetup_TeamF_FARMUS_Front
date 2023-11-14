import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/farmclub/component/button_to_search.dart';
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
        ],
      ),
    );
  }
}
