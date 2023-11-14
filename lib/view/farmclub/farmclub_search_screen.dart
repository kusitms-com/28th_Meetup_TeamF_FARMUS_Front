import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/search_category.dart';
import 'package:mojacknong_android/view/farmclub/component/search_edit.dart';

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
              Text(
                "팜클럽 탐색",
                style: FarmusThemeData.grey1Style14,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: SearchEdit(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "취소",
                        style: FarmusThemeData.grey1Style11,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SearchCategory(
                  title: "재배 난이도", categories: ["Easy", "Normal", "Hard"]),
              SearchCategory(title: "팜클럽 상태", categories: ["준비 중", "진행 중"]),
              Expanded(
                  child: Center(
                child: Text(
                  "팜클럽 이름, 채소 이름으로\n검색해보세요",
                  textAlign: TextAlign.center,
                  style: FarmusThemeData.grey2Style14,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
