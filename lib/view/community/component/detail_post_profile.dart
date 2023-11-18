import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class DetailPostProfile extends StatefulWidget {
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
  State<DetailPostProfile> createState() => _DetailPostProfileState();
}

class _DetailPostProfileState extends State<DetailPostProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: widget.profileImage != ""
                ? Image.network(
                    widget.profileImage!,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  )
                : SvgPicture.asset(
                    'assets/image/ic_profile.svg',
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.nickname,
                style: TextStyle(color: FarmusThemeData.dark, fontSize: 16),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                widget.postTime,
                style: TextStyle(color: FarmusThemeData.grey2, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
