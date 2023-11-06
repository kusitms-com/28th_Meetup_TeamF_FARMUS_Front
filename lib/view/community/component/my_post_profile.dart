import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class MyPostProfile extends StatefulWidget {
  @override
  State<MyPostProfile> createState() => _CommunityProfileState();
}

class _CommunityProfileState extends State<MyPostProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/image/ic_profile.svg",
              width: 44,
              height: 44,
            ),
            const SizedBox(
              width: 8,
            ),
            const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "노준국",
                    style: TextStyle(color: FarmusThemeData.dark, fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "10/29 16:12",
                    style:
                        TextStyle(color: FarmusThemeData.grey2, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
