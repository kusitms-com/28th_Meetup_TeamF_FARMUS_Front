import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class DetailPostProfile extends StatelessWidget {
  final String? profileImage;
  final String nickname;
  final String postTime;

  DetailPostProfile({
    Key? key,
    this.profileImage,
    required this.nickname,
    required this.postTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            profileImage!,
            width: 44,
            height: 44,
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nickname,
                style: TextStyle(color: FarmusThemeData.dark, fontSize: 16),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                postTime,
                style: TextStyle(color: FarmusThemeData.grey2, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
