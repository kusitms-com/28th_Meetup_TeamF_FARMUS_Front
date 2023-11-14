import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class GroupRateStepFalse extends StatefulWidget {
  final String person;
  final String step;
  const GroupRateStepFalse(
      {super.key, required this.person, required this.step});

  @override
  State<GroupRateStepFalse> createState() => _GroupRateStepFalseState();
}

class _GroupRateStepFalseState extends State<GroupRateStepFalse> {
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
              color: FarmusThemeData.groupRateBackground,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "",
                  style: TextStyle(
                    fontFamily: "Pretendard",
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
                    SvgPicture.asset(
                      "assets/image/ic_group_step.svg",
                      color: FarmusThemeData.grey2,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${widget.person}명",
                      style: TextStyle(
                        color: FarmusThemeData.grey2,
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
              color: FarmusThemeData.grey5,
            ),
            child: Text(
              "Step ${widget.step}",
              style: TextStyle(
                color: FarmusThemeData.grey2,
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
