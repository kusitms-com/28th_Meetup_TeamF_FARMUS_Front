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
          color: FarmusThemeData.background,
        ),
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    try {
      return image.isEmpty
          ? Image.asset(
              "assets/image/image_example_community.png",
              fit: BoxFit.fill,
            )
          : Image.network(
              image,
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else if (loadingProgress.cumulativeBytesLoaded ==
                    loadingProgress.expectedTotalBytes) {
                  // 이미지가 완전히 로드된 경우
                  return child;
                } else {
                  // 이미지 로딩 중
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          FarmusThemeData.brownButton),
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
            );
    } catch (e) {
      return Image.asset(
        "assets/image/image_example_community2.png",
        fit: BoxFit.fill,
      );
    }
  }
}
