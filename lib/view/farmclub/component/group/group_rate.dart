import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/group/group_rate_step_false.dart';
import 'package:mojacknong_android/view/farmclub/component/group/group_rate_step_true.dart';

class GroupRate extends StatefulWidget {
  const GroupRate({super.key});

  @override
  State<GroupRate> createState() => _GroupRateState();
}

class _GroupRateState extends State<GroupRate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                "팜클럽 현황",
                style: FarmusThemeData.darkStyle12,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GroupRateStepTrue(
                    person: "1",
                    step: "0",
                  ),
                  GroupRateStepFalse(
                    person: "0",
                    step: "1",
                  ),
                  GroupRateStepFalse(
                    person: "3",
                    step: "2",
                  ),
                  GroupRateStepFalse(
                    person: "1",
                    step: "3",
                  ),
                  GroupRateStepFalse(
                    person: "2",
                    step: "4",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
