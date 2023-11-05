import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/view/community/component/button_next_my_post.dart';
import 'package:mojacknong_android/view/community/component/community_category.dart';

class CommunityScreen extends StatefulWidget {
  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<String> category = <String>["도와주세요", "자랑할래요", "정보나눔"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                ...category.map(
                  (item) {
                    return CommunityCategory(category: item);
                  },
                ).toList(),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ButtonNextMyPost(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
