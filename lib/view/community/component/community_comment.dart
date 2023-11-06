import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/community/component/community_profile.dart';

class CommunityComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CommunityProfile(
            profileImage: "assets/image/image_example_profile2.png",
            nickname: "감자",
            postTime: "11/6 19:01",
          )
        ],
      ),
    );
  }
}
