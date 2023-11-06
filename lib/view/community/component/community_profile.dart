import 'package:flutter/widgets.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          widget.profileImage,
          width: 32,
          height: 32,
          fit: BoxFit.fill,
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
      ],
    );
  }
}
