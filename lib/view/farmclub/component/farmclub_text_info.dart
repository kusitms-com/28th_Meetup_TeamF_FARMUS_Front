import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class FarmclubTextInfo extends StatefulWidget {
  final String vegetable;
  final String farmclubTitle;
  final String level;
  final String nowPerson;
  final String maxPerson;
  final String dday;

  FarmclubTextInfo({
    Key? key,
    required this.vegetable,
    required this.farmclubTitle,
    required this.level,
    required this.nowPerson,
    required this.maxPerson,
    required this.dday,
  }) : super(key: key);

  @override
  State<FarmclubTextInfo> createState() => _FarmclubTextInfoState();
}

class _FarmclubTextInfoState extends State<FarmclubTextInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.farmclubTitle,
                style: FarmusThemeData.darkStyle16,
              ),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset("assets/image/line_vertical_grey1.svg"),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.vegetable,
                style: FarmusThemeData.darkStyle13,
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.level,
                style: FarmusThemeData.brownText13,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.nowPerson,
                style: FarmusThemeData.darkStyle13,
              ),
              Text(
                "/",
                style: FarmusThemeData.darkStyle13,
              ),
              Text(
                widget.maxPerson,
                style: FarmusThemeData.darkStyle13,
              ),
              Text(
                "명",
                style: FarmusThemeData.darkStyle13,
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "시작한 지 ",
                style: FarmusThemeData.grey1Style11,
              ),
              Text(
                widget.dday,
                style: FarmusThemeData.grey1Style11,
              ),
              Text(
                "일째",
                style: FarmusThemeData.grey1Style11,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
