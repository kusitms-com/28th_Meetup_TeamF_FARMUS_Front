import 'package:flutter/widgets.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/community/component/community_post_time.dart';

class CommunityProfile extends StatefulWidget {
  final String? profileImage;
  final String nickname;
  final String postTime;
  final String? comment;

  const CommunityProfile({
    Key? key,
    this.profileImage,
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
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child:
                  (widget.profileImage == null || widget.profileImage!.isEmpty)
                      ? Image.asset(
                          "assets/image/image_example_profile2.png",
                          width: 32,
                          height: 32,
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          widget.profileImage!,
                          width: 32,
                          height: 32,
                          fit: BoxFit.fill,
                        ),
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
