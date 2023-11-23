import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:percent_indicator/percent_indicator.dart';

//progressbar
class HomeFinalProgressBar extends StatelessWidget {
  final int currentPage;

  const HomeFinalProgressBar({Key? key, required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percent = (currentPage - 0.5) / 3;

    return LinearPercentIndicator(
      padding: EdgeInsets.zero,
      percent: percent,
      alignment: MainAxisAlignment.start,
      animation: true,
      animationDuration: 600,
      animateFromLastPercent: true,
      backgroundColor: FarmusThemeData.grey4,
      progressColor: FarmusThemeData.green1,
      lineHeight: 6,
    );
  }
}
