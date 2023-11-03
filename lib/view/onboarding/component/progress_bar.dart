import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../common/farmus_theme_data.dart';

class ProgressBar extends StatelessWidget {
  final int currentPage;

  const ProgressBar({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percent = (currentPage - 1) / 4;

    return LinearPercentIndicator(
      padding: EdgeInsets.zero,
      percent: percent,
      alignment: MainAxisAlignment.start,
      animation: true,
      animationDuration: 1200,
      animateFromLastPercent: true,
      backgroundColor: FarmusThemeData.grey3,
      progressColor: FarmusThemeData.button,
      lineHeight: 10,
    );
  }
}
