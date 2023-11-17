import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_make_screen.dart';

class MyFarmclub extends StatefulWidget {
  final bool isLast;
  final String? myFarmclubImage;

  MyFarmclub({super.key, required this.isLast, this.myFarmclubImage});

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
          onTap: () {
            widget.isLast == true
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FarmclubMakeScreen();
                      },
                    ),
                  )
                : null;
          },
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: FarmusThemeData.brown3,
            ),
            child: widget.isLast
                ? Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      "assets/image/ic_plus.svg",
                      color: FarmusThemeData.brownText,
                    ))
                : Image.asset(
                    widget.myFarmclubImage!,
                    fit: BoxFit.fill,
                  ),
          ),
        ),
      ),
    );
  }
}
