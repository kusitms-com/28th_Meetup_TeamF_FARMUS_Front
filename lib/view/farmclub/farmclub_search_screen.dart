import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/model/farmclub_info_model.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub.dart';
import 'package:mojacknong_android/view/farmclub/component/search/search_category.dart';
import 'package:mojacknong_android/view/farmclub/component/search/search_edit.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_search_controller.dart';

class FarmclubSearchScreen extends StatefulWidget {
  @override
  State<FarmclubSearchScreen> createState() => _FarmclubSearchScreenState();
}

class _FarmclubSearchScreenState extends State<FarmclubSearchScreen> {
  FarmclubSearchController _controller = Get.put(FarmclubSearchController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // 렌더링 후에 호출되는 코드
      _controller.updateSelectedKeyword("");

      // 초기 상태에서의 메시지를 표시하기 위한 조건 추가
      if (_controller.farmclubList.isEmpty) {
        _controller.isCombinedWidgetVisible.value = true;
      }
    });
  }

  @override
  void dispose() {
    _controller.farmclubList.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "팜클럽 탐색",
                style: FarmusThemeData.grey1Style14,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SearchEdit(onSubmitted: () {
                      _controller.onSearchButtonPressed();
                      _controller.updateCombinedWidgetVisible("");
                    }),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Bouncing(
                    onPress: () {},
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "취소",
                          style: FarmusThemeData.grey1Style14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SearchCategory(
                  title: "재배 난이도", categories: ["Easy", "Normal", "Hard"]),
              SearchCategory(
                title: "팜클럽 상태",
                categories: ["준비 중", "진행 중"],
              ),
              Expanded(
                child: Obx(
                  () {
                    return _controller.isCombinedWidgetVisible.value
                        ? Center(
                            child: Text(
                              '팜클럽 이름, 채소 이름으로\n검색해보세요',
                              textAlign: TextAlign.center,
                              style: FarmusThemeData.grey2Style14,
                            ),
                          )
                        : _controller.farmclubList.isEmpty
                            ? Center(
                                child: Text(
                                  '검색 결과가 없습니다.',
                                  style: FarmusThemeData.grey2Style14,
                                ),
                              )
                            : ListView.builder(
                                itemCount: _controller.farmclubList.length,
                                itemBuilder: (context, index) {
                                  FarmclubInfoModel data =
                                      _controller.farmclubList[index];
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: Farmclub(
                                            id: data.challengeId,
                                            title: data.challengeName,
                                            vaggie: data.veggieName,
                                            currentUser: data.currentUser,
                                            image: data.image,
                                            level: data.difficulty,
                                            maxUser: data.maxUser,
                                            status: data.status,
                                          challengeId: data.challengeId.toString(),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
