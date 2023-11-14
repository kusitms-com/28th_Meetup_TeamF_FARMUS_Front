import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/search/search_category.dart';
import 'package:mojacknong_android/view/farmclub/component/search/search_edit.dart';

class FarmclubSearchScreen extends StatefulWidget {
  @override
  State<FarmclubSearchScreen> createState() => _FarmclubSearchScreenState();
}

class _FarmclubSearchScreenState extends State<FarmclubSearchScreen> {
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
                children: [
                  const Expanded(
                    child: SearchEdit(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Bouncing(
                      onPress: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "취소",
                          style: FarmusThemeData.grey1Style11,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SearchCategory(
                  title: "재배 난이도", categories: ["Easy", "Normal", "Hard"]),
              const SearchCategory(
                  title: "팜클럽 상태", categories: ["준비 중", "진행 중"]),
              const Expanded(
                child: Center(
                  child: Text(
                    "팜클럽 이름, 채소 이름으로\n검색해보세요",
                    textAlign: TextAlign.center,
                    style: FarmusThemeData.grey2Style14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
