import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class CommunityProfile extends StatefulWidget {
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
            "assets/image/ic_profile.svg",
            width: 32,
            height: 32,
          ),
          const SizedBox(
            width: 8,
          ),
          const Text(
            "노준국",
            style: TextStyle(
              color: FarmusThemeData.dark,
              fontSize: 16,
              fontFamily: "Pretendard",
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const Text(
            "10/29 16:12",
            style: TextStyle(
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
          const Text(
            "0",
            style: TextStyle(
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
