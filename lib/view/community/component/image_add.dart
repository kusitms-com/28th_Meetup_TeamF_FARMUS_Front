import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class ImageAdd extends StatefulWidget {
  final String title;
  const ImageAdd({super.key, required this.title});

  @override
  State<ImageAdd> createState() => _ImageAddState();
}

class _ImageAddState extends State<ImageAdd> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/image/ic_camera.svg",
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          widget.title,
          style: FarmusThemeData.grey2Style14,
        ),
      ],
    );
  }
}
