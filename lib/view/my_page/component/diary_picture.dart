import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class DiaryPicture extends StatefulWidget {
  final String? dateTime;
  final String? content;
  final String? postImage;




  DiaryPicture({
    super.key,
    required this.postImage,
    required this.content,
    required this.dateTime
  });

  @override
  State<DiaryPicture> createState() => _DiaryPictureState();
}

class _DiaryPictureState extends State<DiaryPicture> {
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
              child: Image.network(
                widget.postImage!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 248,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '${widget.content}',
            style: FarmusThemeData.darkStyle14,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '${widget.dateTime}',
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

