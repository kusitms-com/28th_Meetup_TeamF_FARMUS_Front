import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class ChallengeStep extends StatefulWidget {
  final int? step;
  final String? title;
  final Color? color;

  const ChallengeStep(
      {super.key, required this.step, required this.title, this.color});

  @override
  State<ChallengeStep> createState() => _ChallengeStepState();
}

class _ChallengeStepState extends State<ChallengeStep> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 16,
            ),
            Text(
              "Step ${widget.step}",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontSize: 14,
                color: widget.color == null
                    ? FarmusThemeData.brownText
                    : widget.color,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            SvgPicture.asset(
              "assets/image/line_vertical_grey1.svg",
            ),
            SizedBox(
              width: 8,
            ),
            Text("${widget.title}"),
          ],
        ),
      ],
    );
  }
}
