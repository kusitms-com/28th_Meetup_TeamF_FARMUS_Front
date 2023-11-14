import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class RecommendFarmclub extends StatefulWidget {
  final String farmclubImage;
  final String vegetable;
  final String farmclubTitle;
  final String level;

  final String nowPerson;
  final String maxPerson;
  final String dday;

  RecommendFarmclub({
    Key? key,
    required this.vegetable,
    required this.farmclubImage,
    required this.farmclubTitle,
    required this.level,
    required this.nowPerson,
    required this.maxPerson,
    required this.dday,
  }) : super(key: key);

  @override
  State<RecommendFarmclub> createState() => _RecommendFarmclubState();
}

class _RecommendFarmclubState extends State<RecommendFarmclub> {
  final TextStyle textStyle = const TextStyle(
    color: FarmusThemeData.dark,
    fontSize: 16,
    fontFamily: "Pretendard",
  );

  final TextStyle greyTextStyle = const TextStyle(
    color: FarmusThemeData.grey1,
    fontSize: 11,
    fontFamily: "Pretendard",
  );

  final TextStyle brownTextStyle = const TextStyle(
    color: FarmusThemeData.brownText,
    fontSize: 13,
    fontFamily: "Pretendard",
  );

  final TextStyle darkTextStyle = const TextStyle(
    color: FarmusThemeData.dark,
    fontSize: 13,
    fontFamily: "Pretendard",
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 156,
                height: 156,
                decoration: BoxDecoration(
                  color: FarmusThemeData.background,
                  borderRadius: BorderRadius.circular(8.65),
                ),
                child: Image.asset(
                  widget.farmclubImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: FarmusThemeData.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    widget.vegetable,
                    style: darkTextStyle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.farmclubTitle,
                style: textStyle,
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
                style: textStyle.copyWith(fontSize: 13),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                widget.level,
                style: brownTextStyle,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.nowPerson,
                style: darkTextStyle,
              ),
              Text(
                "/",
                style: darkTextStyle,
              ),
              Text(
                widget.maxPerson,
                style: darkTextStyle,
              ),
              Text(
                "명",
                style: darkTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                "시작한 지 ",
                style: greyTextStyle,
              ),
              Text(
                widget.dday,
                style: greyTextStyle,
              ),
              Text(
                "일째",
                style: greyTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
