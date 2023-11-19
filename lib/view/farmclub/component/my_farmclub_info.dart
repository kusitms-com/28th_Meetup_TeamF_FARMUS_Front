import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class MyFarmclubInfo extends StatefulWidget {
  final String level;
  final String now;
  final String max;
  final String status;

  const MyFarmclubInfo({
    super.key,
    required this.level,
    required this.now,
    required this.max,
    required this.status,
  });

  @override
  State<MyFarmclubInfo> createState() => _MyFarmclubInfoState();
}

class _MyFarmclubInfoState extends State<MyFarmclubInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: FarmusThemeData.grey4, // 테두리 색상
            width: 1.0, // 테두리 두께
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "재배 난이도\n${widget.level}",
                textAlign: TextAlign.center,
                style: FarmusThemeData.darkStyle13,
              ),
              SvgPicture.asset(
                "assets/image/line_vertical_grey1.svg",
              ),
              Text(
                "멤버 수\n${widget.now}/${widget.max}명",
                textAlign: TextAlign.center,
                style: FarmusThemeData.darkStyle13,
              ),
              SvgPicture.asset(
                "assets/image/line_vertical_grey1.svg",
              ),
              Text(
                "팜클럽 상태\nD+${widget.status}",
                textAlign: TextAlign.center,
                style: FarmusThemeData.darkStyle13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
