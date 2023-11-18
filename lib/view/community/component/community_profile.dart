import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/community/component/community_post_time.dart';

class CommunityProfile extends StatefulWidget {
  final String profileImage;
  final String nickname;
  final String postTime;
  final String? comment;

  const CommunityProfile({
    Key? key,
    required this.profileImage,
    required this.nickname,
    required this.postTime,
    this.comment,
  }) : super(key: key);

  @override
  State<CommunityProfile> createState() => _CommunityProfileState();
}

class _CommunityProfileState extends State<CommunityProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: widget.profileImage != ""
                ? Image.network(
                    widget.profileImage,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  )
                : SvgPicture.asset(
                    'assets/image/ic_profile.svg', // 기본 이미지 경로
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.nickname,
            style: const TextStyle(
              color: FarmusThemeData.dark,
              fontSize: 16,
              fontFamily: "Pretendard",
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          CommunityPostTime(
            postTime: widget.postTime,
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
