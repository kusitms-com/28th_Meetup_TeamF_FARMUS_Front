import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../common/farmus_theme_data.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      percent: 1,
      alignment: MainAxisAlignment.start,
      animation: true,
      animationDuration: 1200,
      fillColor: FarmusThemeData.grey3,
      progressColor: FarmusThemeData.button,
      lineHeight: 10,
    );
  }
}
