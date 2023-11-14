import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/component/group_rate_step.dart';

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
                "그룹 달성률",
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
                  GroupRateStep(),
                  GroupRateStep(),
                  GroupRateStep(),
                  GroupRateStep(),
                  GroupRateStep(),
                  GroupRateStep(),
                  GroupRateStep(),
                  GroupRateStep(),
                  GroupRateStep(),
                  GroupRateStep(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
