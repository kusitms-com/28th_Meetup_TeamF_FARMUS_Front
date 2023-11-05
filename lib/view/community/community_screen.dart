import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return CommunityCategory(
              category: category[index],
            );
          },
        ),
      ),
    );
  }
}
