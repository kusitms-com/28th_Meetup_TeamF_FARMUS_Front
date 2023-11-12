import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/community/component/bottom_comment.dart';
import 'package:mojacknong_android/view/community/component/community_comment.dart';
import 'package:mojacknong_android/view/community/component/community_content.dart';
import 'package:mojacknong_android/view/community/component/community_picture.dart';
import 'package:mojacknong_android/view/community/component/detail_post_profile.dart';
import 'package:mojacknong_android/view/community/component/post_category.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class DetailPostScreen extends StatefulWidget {
  final String? profileImage;
  final String nickname;
  final String postTime;
  final String postCategory;
  final String title;
  final String content;
  final String image;

  const DetailPostScreen({
    Key? key,
    this.profileImage,
    required this.nickname,
    required this.postTime,
    required this.postCategory,
    required this.title,
    required this.content,
    required this.image,
  }) : super(key: key);

  @override
  _DetailPostScreenState createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  final List<Widget> comments = [];
  final BottomSheetController _controller = Get.put(BottomSheetController());

  _DetailPostScreenState() {
    comments.addAll([
      CommunityComment(),
      CommunityComment(),
      CommunityComment(),
      CommunityComment(),
      CommunityComment(),
      CommunityComment(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(actions: [
        IconButton(
          icon: SvgPicture.asset("assets/image/ic_more_vertical.svg"),
          onPressed: () {
            _controller.showCustomCupertinoActionSheet(context,
                message: "글 메뉴",
                options: ["수정", "삭제", "URL 공유"],
                cancelButtonText: "취소");
          },
        ),
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 100),
          child: Column(
            children: [
              Row(
                children: [
                  DetailPostProfile(
                    profileImage: widget.profileImage != null
                        ? widget.profileImage
                        : null,
                    nickname: widget.nickname,
                    postTime: widget.postTime,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: PostCategory(
                        category: widget.postCategory,
                      ),
                    ),
                  ),
                ],
              ),
              CommunityContent(
                title: widget.title,
                content: widget.content,
              ),
              CommunityPicture(
                image: widget.image,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "댓글",
                    style: TextStyle(
                      color: FarmusThemeData.dark,
                      fontSize: 16,
                      fontFamily: "Pretendard",
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    comments.length.toString(),
                    style: const TextStyle(
                      color: FarmusThemeData.dark,
                      fontSize: 16,
                      fontFamily: "Pretendard",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ...comments,
            ],
          ),
        ),
      ),
      bottomSheet: BottomComment(),
    );
  }
}
