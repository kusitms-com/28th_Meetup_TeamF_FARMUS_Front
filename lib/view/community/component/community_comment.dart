import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/community/component/community_profile.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class CommunityComment extends StatefulWidget {
  final String? profileImage;
  final String nickname;
  final String postTime;
  final String commentContents;

  CommunityComment({
    Key? key,
    this.profileImage,
    required this.nickname,
    required this.postTime,
    required this.commentContents,
  }) : super(key: key);

  @override
  State<CommunityComment> createState() => _CommunityCommentState();
}

class _CommunityCommentState extends State<CommunityComment> {
  final BottomSheetController _controller = BottomSheetController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommunityProfile(
                profileImage: widget.profileImage ?? "", // null이면 빈 문자열로 처리
                nickname: widget.nickname,
                postTime: widget.postTime,
              ),
              Bouncing(
                onPress: () {},
                child: GestureDetector(
                    onTap: () {
                      _controller.showActionSheetComment(
                        context,
                        message: "댓글을 삭제하시겠어요?",
                        cancelText: "취소",
                        confirmText: "확인",
                      );
                    },
                    child:
                        SvgPicture.asset("assets/image/ic_more_vertical.svg")),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 8,
              ),
              Text(
                widget.commentContents,
                style: TextStyle(
                  color: FarmusThemeData.dark,
                  fontFamily: "Pretendard",
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            height: 1,
            indent: 8,
            endIndent: 8,
            color: FarmusThemeData.grey3,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
