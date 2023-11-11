import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class CommunityPicture extends StatelessWidget {
  final String image;

  CommunityPicture({required this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        height: 248,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: FarmusThemeData.background),
        child: image.isEmpty
            ? Image.asset(
                "assets/image/image_example_community.png",
                fit: BoxFit.fill,
              )
            : Image.network(
                image,
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}
