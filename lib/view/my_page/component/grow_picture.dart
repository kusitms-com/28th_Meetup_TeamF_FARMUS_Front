import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class GrowPicture extends StatefulWidget {
  GrowPicture({
    super.key,
  });

  @override
  State<GrowPicture> createState() => _GrowPictureState();
}

class _GrowPictureState extends State<GrowPicture> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            height: 248,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/image/image_example_community.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "직접 키른 상추로 건강한 식사 한 끼! \n상훈아 그동안 고마웠다.",
            style: FarmusThemeData.darkStyle14,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "10/29 3:40",
            style: FarmusThemeData.grey2Style13,
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
