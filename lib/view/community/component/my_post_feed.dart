import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/community/component/community_comment_count.dart';
import 'package:mojacknong_android/view/community/component/community_content.dart';
import 'package:mojacknong_android/view/community/component/community_picture.dart';
import 'package:mojacknong_android/view/community/component/community_post_time.dart';
import 'package:mojacknong_android/view/community/component/post_category.dart';
import 'package:mojacknong_android/view/community/detail/detail_post_screen.dart';

class MyPostFeed extends StatelessWidget {
  final String postTime;
  final String comment;
  final String postCategory;
  final String title;
  final String content;
  final String image;

  MyPostFeed({
    Key? key,
    required this.postTime,
    required this.comment,
    required this.postCategory,
    required this.title,
    required this.content,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPostScreen(
                profileImage: "assets/image/image_example_profile.png",
                nickname: "어쩌구",
                postTime: postTime,
                postCategory: postCategory,
                title: title,
                content: content,
                image: image,
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
                    PostCategory(category: postCategory),
                    CommunityPostTime(postTime: postTime),
                    SizedBox(
                      width: 8,
                    ),
                    CommunityCommentCount(comment: comment),
                  ],
                ),
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
