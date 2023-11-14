import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class FarmclubTitle extends StatefulWidget {
  const FarmclubTitle({super.key});

  @override
  State<FarmclubTitle> createState() => _FarmclubTitleState();
}

class _FarmclubTitleState extends State<FarmclubTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "상추 좋아하세요",
                style: FarmusThemeData.darkStyle18,
              ),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset("assets/image/line_vertical_grey1.svg"),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "상추",
                style: FarmusThemeData.darkStyle13,
              ),
              const Spacer(),
              Bouncing(
                onPress: () {},
                child: SvgPicture.asset(
                  "assets/image/ic_more_vertical.svg",
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "상추를 치료해줄 사람 어디 없나. 저만 매번 실패하나요..\n이번에는 꼭 성공해서 얼른 상추쌈 싸먹어봐요!",
            style: FarmusThemeData.darkStyle13,
          ),
        ],
      ),
    );
  }
}
