import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../common/farmus_theme_data.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LinearPercentIndicator(
        padding: EdgeInsets.zero,
        percent: 0,
        alignment: MainAxisAlignment.start,
        animation: true,
        animationDuration: 1200,
        backgroundColor: FarmusThemeData.grey3,
        progressColor: FarmusThemeData.button,
        lineHeight: 10,
      ),
    );
  }
}
