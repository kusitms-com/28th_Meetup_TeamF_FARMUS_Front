import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/farmclub/component/explore/recommned_farmclub.dart';

class RecommendFarmclubList extends StatefulWidget {
  @override
  State<RecommendFarmclubList> createState() => _RecommendFarmclubListState();
}

class _RecommendFarmclubListState extends State<RecommendFarmclubList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            RecommendFarmclub(
              farmclubImage: "assets/image/image_farmclub_green.png",
              vegetable: "상추",
              farmclubTitle: "상추 좋아하세요",
              level: "Easy",
              nowPerson: "5",
              maxPerson: "8",
              dday: "1",
            ),
            RecommendFarmclub(
              farmclubImage: "assets/image/image_farmclub_purple.png",
              vegetable: "상추",
              farmclubTitle: "상추우욱",
              level: "Easy",
              nowPerson: "4",
              maxPerson: "14",
              dday: "23",
            ),
            RecommendFarmclub(
              farmclubImage: "assets/image/image_farmclub_blue.png",
              vegetable: "대파",
              farmclubTitle: "파파팟",
              level: "Easy",
              nowPerson: "5",
              maxPerson: "8",
              dday: "",
            ),
            RecommendFarmclub(
              farmclubImage: "assets/image/image_farmclub_purple.png",
              vegetable: "방울토마토",
              farmclubTitle: "멋쟁이 토마토",
              level: "Hard",
              nowPerson: "2",
              maxPerson: "10",
              dday: "6",
            ),
            RecommendFarmclub(
              farmclubImage: "assets/image/image_farmclub_green.png",
              vegetable: "깻잎",
              farmclubTitle: "깻잎은 깬닙",
              level: "Normal",
              nowPerson: "7",
              maxPerson: "20",
              dday: "42",
            ),
            RecommendFarmclub(
              farmclubImage: "assets/image/image_farmclub_blue.png",
              vegetable: "상추",
              farmclubTitle: "상추 좋아하세요",
              level: "Easy",
              nowPerson: "5",
              maxPerson: "8",
              dday: "1",
            ),
          ],
        ),
      ),
    );
  }
}
