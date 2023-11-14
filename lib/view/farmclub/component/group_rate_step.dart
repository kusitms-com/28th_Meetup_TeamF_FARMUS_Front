import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class GroupRateStep extends StatefulWidget {
  const GroupRateStep({super.key});

  @override
  State<GroupRateStep> createState() => _GroupRateStepState();
}

class _GroupRateStepState extends State<GroupRateStep> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
            width: 77,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: FarmusThemeData.green1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "현재 step",
                  style: TextStyle(
                    color: FarmusThemeData.greenLight3,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/image/ic_group_step.svg"),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "1명",
                      style: TextStyle(
                        color: FarmusThemeData.primary,
                        fontSize: 14,
                        fontFamily: "Pretendard",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 77,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: FarmusThemeData.green2,
            ),
            child: Text(
              "step 0",
              style: TextStyle(
                color: FarmusThemeData.primary,
                fontSize: 12,
                fontFamily: "Pretendard",
              ),
            ),
          )
        ],
      ),
    );
  }
}
