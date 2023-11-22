import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/challenge/challenge_step.dart';

class FarmclubHelp extends StatelessWidget {
  const FarmclubHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChallengeStep(
          step: 0,
          title: "준비물을 챙겨요",
          color: FarmusThemeData.dark,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "상추 씨앗과 상토, 재배 용기를 준비해 주세요\n베란다에서는 로메인 상추가 잘 자라요\n씨앗은 2달, 모종은 1달 후에 먹을 수 있어요\n모종은 4~5월, 9~10월에 판매해요",
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
