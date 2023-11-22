import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';

class FarmclubHelp extends StatelessWidget {
  final int step;
  final String title;
  final List<String> tips;

  FarmclubHelp({
    Key? key,
    required this.step,
    required this.title,
    required this.tips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChallengeStep(
          step: step,
          title: title,
          color: FarmusThemeData.dark,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            tips.join('\n'),
            style: FarmusThemeData.darkStyle14,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}