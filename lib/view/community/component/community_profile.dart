import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class CommunityProfile extends StatefulWidget {
  final String profileImage;
  final String nickname;
  final String postTime;
  final String comment;

  const CommunityProfile({
    Key? key,
    required this.profileImage,
    required this.nickname,
    required this.postTime,
    required this.comment,
  }) : super(key: key);

  @override
  State<CommunityProfile> createState() => _CommunityProfileState();
}

class _CommunityProfileState extends State<CommunityProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.profileImage,
            width: 32,
            height: 32,
          ),
          const SizedBox(
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
          Text(
            widget.postTime,
            style: const TextStyle(
              color: FarmusThemeData.grey2,
              fontSize: 12,
              fontFamily: "Pretendard",
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const Text(
            "댓글",
            style: TextStyle(
              color: FarmusThemeData.grey2,
              fontSize: 12,
              fontFamily: "Pretendard",
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            widget.comment,
            style: const TextStyle(
              color: FarmusThemeData.grey2,
              fontSize: 12,
              fontFamily: "Pretendard",
            ),
          ),
        ],
      ),
    );
  }
}
