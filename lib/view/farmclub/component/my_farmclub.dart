import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class MyFarmclub extends StatefulWidget {
  final String myFarmclubImage;

  MyFarmclub({super.key, required this.myFarmclubImage});

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
            child: Image.asset(
              widget.myFarmclubImage,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
