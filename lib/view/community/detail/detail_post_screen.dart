import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/model/community_detail.dart';
import 'package:mojacknong_android/repository/community_repository.dart';
import 'package:mojacknong_android/view/community/component/bottom_comment.dart';
import 'package:mojacknong_android/view/community/component/community_comment.dart';
import 'package:mojacknong_android/view/community/component/community_content.dart';
import 'package:mojacknong_android/view/community/component/community_picture.dart';
import 'package:mojacknong_android/view/community/component/detail_post_profile.dart';
import 'package:mojacknong_android/view/community/component/post_category.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class DetailPostScreen extends StatefulWidget {
  final int postingId;

  const DetailPostScreen({
    Key? key,
    required this.postingId,
  }) : super(key: key);

  @override
  _DetailPostScreenState createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  final BottomSheetController _controller = BottomSheetController();
  late Future<CommunityDetail> _communityDetailFuture;

  @override
  void initState() {
    super.initState();
    _communityDetailFuture =
        CommunityRepository.getPostingDetails(widget.postingId, 1);
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
      body: FutureBuilder<CommunityDetail>(
        future: _communityDetailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: const AlwaysStoppedAnimation<Color>(
                  FarmusThemeData.brownButton,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("에러 발생: ${snapshot.error}");
          } else {
            CommunityDetail communityDetail = snapshot.data!;

            if (communityDetail.postingCommentList == null ||
                communityDetail.postingCommentList!.isEmpty) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 100),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          DetailPostProfile(
                            profileImage:
                                communityDetail.wholePostingDto.postingImage,
                            nickname:
                                communityDetail.wholePostingDto.nickName ?? "",
                            postTime:
                                communityDetail.wholePostingDto.createdAt ?? "",
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: PostCategory(
                                category: communityDetail.wholePostingDto.tag,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CommunityContent(
                        title: communityDetail.wholePostingDto.title,
                        content: communityDetail.wholePostingDto.contents,
                      ),
                      CommunityPicture(
                        image:
                            communityDetail.wholePostingDto.postingImage.first,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          const Text(
                            "댓글",
                            style: TextStyle(
                              color: FarmusThemeData.dark,
                              fontSize: 16,
                              fontFamily: "Pretendard",
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "0",
                            style: const TextStyle(
                              color: FarmusThemeData.dark,
                              fontSize: 16,
                              fontFamily: "Pretendard",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            }

            // If there are comments, display them
            List<Widget> comments = communityDetail.postingCommentList
                    ?.map((comment) => CommunityComment(
                          profileImage: comment.userImageUrl,
                          nickname: comment.nickName ?? "",
                          postTime: comment.createdAt,
                          commentContents: comment.commentContents,
                        ))
                    .toList() ??
                [];

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 100),
                child: Column(
                  children: [
                    Row(
                      children: [
                        DetailPostProfile(
                          profileImage:
                              communityDetail.wholePostingDto.postingImage,
                          nickname:
                              communityDetail.wholePostingDto.nickName ?? "",
                          postTime:
                              communityDetail.wholePostingDto.createdAt ?? "",
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: PostCategory(
                              category: communityDetail.wholePostingDto.tag,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CommunityContent(
                      title: communityDetail.wholePostingDto.title,
                      content: communityDetail.wholePostingDto.contents,
                    ),
                    CommunityPicture(
                      image: communityDetail.wholePostingDto.postingImage.first,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        const Text(
                          "댓글",
                          style: TextStyle(
                            color: FarmusThemeData.dark,
                            fontSize: 16,
                            fontFamily: "Pretendard",
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          communityDetail.postingCommentList != null &&
                                  communityDetail.postingCommentList!.isNotEmpty
                              ? communityDetail.postingCommentList!.length
                                  .toString()
                              : "0",
                          style: const TextStyle(
                            color: FarmusThemeData.dark,
                            fontSize: 16,
                            fontFamily: "Pretendard",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...comments,
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomSheet: BottomComment(),
    );
  }
}
