import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';
import 'package:mojacknong_android/view/farmclub/component/explore/recommned_farmclub.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_explore_controller.dart';

import '../../../../model/farmclub_detail.dart';

class RecommendFarmclubList extends StatefulWidget {
  @override
  State<RecommendFarmclubList> createState() => _RecommendFarmclubListState();
}

class _RecommendFarmclubListState extends State<RecommendFarmclubList> {
  late FarmclubExploreController _exploreController;

  @override
  void initState() {
    super.initState();
    _exploreController = Get.find<FarmclubExploreController>();
    _exploreController.getFarmclubRecommend();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(
          () {
            // 데이터가 로드되었는지 확인하고 null이 아닌 경우에만 표시
            if (_exploreController.farmclubRecommendList.isNotEmpty) {
              return Row(
                children: [
                  for (FarmclubInfoModel data
                      in _exploreController.farmclubRecommendList)
                    RecommendFarmclub(
                      id: data.challengeId,
                      farmclubImage: data.image,
                      vegetable: data.veggieName,
                      farmclubTitle: data.challengeName,
                      level: data.difficulty,
                      nowPerson: data.currentUser,
                      maxPerson: data.maxUser,
                    ),
                ],
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: FarmusThemeData.brown,
              ));
            }
          },
        ),
      ),
    );
  }
}
