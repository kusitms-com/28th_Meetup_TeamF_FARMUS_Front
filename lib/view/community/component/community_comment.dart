import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/community/component/community_profile.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class CommunityComment extends StatelessWidget {
  final BottomSheetController _controller = BottomSheetController();

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
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommunityProfile(
                  profileImage: profileImage,
                  nickname: nickname,
                  postTime: postTime,
                ),
                Bouncing(
                  onPress: () {
                    _controller.openBottomSheet();
                    _controller.showActionSheetComment(
                      context,
                      message: "댓글을 삭제하시겠어요?",
                      cancelText: "취소",
                      confirmText: "확인",
                    );
                  },
                  child: SvgPicture.asset("assets/image/ic_more_vertical.svg"),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              commentContents,
              style: TextStyle(
                color: FarmusThemeData.dark,
                fontFamily: "Pretendard",
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              height: 1,
              color: FarmusThemeData.grey3,
            ),
          ],
        ),
      ),
    );
  }
}
