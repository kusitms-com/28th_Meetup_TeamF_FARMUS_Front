import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/farmclub_init.dart';

class FarmclubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
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
                  SvgPicture.asset(
                    "assets/image/ic_search.svg",
                  ),
                ],
              ),
            ),
            Expanded(child: FarmclubInit()),
          ],
        ),
      ),
    );
  }
}
