import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/view/community/component/community_content.dart';
import 'package:mojacknong_android/view/community/component/community_picture.dart';
import 'package:mojacknong_android/view/community/component/community_profile.dart';
import 'package:mojacknong_android/view/community/component/post_category.dart';
import 'package:mojacknong_android/view/community/detail/detail_post_screen.dart';

class CommunityFeed extends StatelessWidget {
  final String profileImage;
  final String nickname;
  final String postTime;
  final String comment;
  final String postCategory;
  final String content;
  final String image;

  CommunityFeed({
    Key? key,
    required this.profileImage,
    required this.nickname,
    required this.postTime,
    required this.comment,
    required this.postCategory,
    required this.content,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPostScreen();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommunityProfile(
                    profileImage: profileImage,
                    nickname: nickname,
                    postTime: postTime,
                    comment: comment),
                PostCategory(category: postCategory),
              ],
            ),
            CommunityContent(
              content: content,
            ),
            CommunityPicture(
              image: image,
            ),
          ],
        ),
      ),
    );
  }
}
