import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/model/farmclub_mine_detail.dart';
import 'package:mojacknong_android/view/farmclub/component/group/group_rate_step_false.dart';
import 'package:mojacknong_android/view/farmclub/component/group/group_rate_step_true.dart';

class GroupRate extends StatelessWidget {
  final FarmclubMineDetail farmclubInfo;

  const GroupRate({
    Key? key,
    required this.farmclubInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> personValues = farmclubInfo.achievement.map((value) => value.toString()).toList();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 16),
              Text(
                "팜클럽 현황",
                style: FarmusThemeData.darkStyle12,
              ),
            ],
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  for (int i = 0; i < personValues.length; i++)
                    (i == farmclubInfo.stepNum)
                        ? GroupRateStepTrue(person: personValues[i], step: i.toString())
                        : GroupRateStepFalse(person: personValues[i], step: i.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
