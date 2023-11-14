import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class RecommendFarmclub extends StatefulWidget {
  const RecommendFarmclub({Key? key}) : super(key: key);

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
                  "assets/image/image_farmclub_green.png",
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
                    "상추",
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
                "상추 좋아하세요",
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
                "상추",
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
                "Easy",
                style: brownTextStyle,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "5/8명",
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
                "1",
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
