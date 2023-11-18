import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view/community/component/community_comment_count.dart';
import 'package:mojacknong_android/view/community/component/community_content.dart';
import 'package:mojacknong_android/view/community/component/community_picture.dart';
import 'package:mojacknong_android/view/community/component/community_profile.dart';
import 'package:mojacknong_android/view/community/component/post_category.dart';
import 'package:mojacknong_android/view/community/detail/detail_post_screen.dart';
import 'package:mojacknong_android/view_model/controllers/community_feed_controller.dart';

class CommunityFeed extends StatelessWidget {
  final int postingId;
  final int userId;
  final String profileImage;
  final String nickname;
  final String postTime;
  final String comment;
  final String postCategory;
  final String title;
  final String content;
  final String image;

  CommunityFeed({
    Key? key,
    required this.postingId,
    required this.userId,
    required this.profileImage,
    required this.nickname,
    required this.postTime,
    required this.comment,
    required this.postCategory,
    required this.title,
    required this.content,
    required this.image,
  }) : super(key: key);

  final CommunityFeedController _communityController =
      Get.put(CommunityFeedController());

  @override
  Widget build(BuildContext context) {
    print(profileImage);

    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPostScreen(
                postingId: postingId,
                userId: userId,
                onDetailScreenPopped: () {
                  _communityController.getWholePosting();
                },
              );
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
                Row(
                  children: [
                    CommunityProfile(
                      profileImage: profileImage,
                      nickname: nickname,
                      postTime: postTime,
                    ),
                    CommunityCommentCount(comment: comment),
                  ],
                ),
                PostCategory(category: postCategory),
              ],
            ),
            CommunityContent(
              title: title,
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
