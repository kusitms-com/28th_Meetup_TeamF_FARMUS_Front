import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/community/component/community_post_time.dart';

class RecordProfile extends StatefulWidget {
  final String? profile;
  final String nickname;
  final String postTime;

  const RecordProfile({
    super.key,
    this.profile,
    required this.nickname,
    required this.postTime,
  });

  @override
  State<RecordProfile> createState() => _RecordProfileState();
}

class _RecordProfileState extends State<RecordProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: widget.profile != null
                  ? Image.network(
                      widget.profile!,
                      fit: BoxFit.cover,
                    )
                  : SvgPicture.asset("assets/image/ic_profile.svg"),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(widget.nickname, style: FarmusThemeData.darkStyle16),
          Spacer(),
          CommunityPostTime(
            postTime: widget.postTime,
          ),
        ],
      ),
    );
  }
}
