import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class MyFarmclub extends StatefulWidget {
  final String myFarmclubImage;

  MyFarmclub({Key? key, required this.myFarmclubImage}) : super(key: key);

  @override
  State<MyFarmclub> createState() => _MyFarmclubState();
}

class _MyFarmclubState extends State<MyFarmclub> {
  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: FarmusThemeData.brown3,
            ),
            child: widget.myFarmclubImage.isNotEmpty
                ? Image.network(
              widget.myFarmclubImage,
              fit: BoxFit.fill,
            )
                : Placeholder(), // 이미지가 없는 경우에 대한 예외 처리
          ),
        ),
      ),
    );
  }
}
