import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class FarmclubTextInfo extends StatefulWidget {
  final String vegetable;
  final String farmclubTitle;
  final String level;
  final int nowPerson;
  final int maxPerson;
  final String? dday;
  final String status;
  final bool isRecommend;

  FarmclubTextInfo(
      {Key? key,
      required this.vegetable,
      required this.farmclubTitle,
      required this.level,
      required this.nowPerson,
      required this.maxPerson,
      this.dday,
      required this.isRecommend,
      required this.status})
      : super(key: key);

  @override
  State<FarmclubTextInfo> createState() => _FarmclubTextInfoState();
}

class _FarmclubTextInfoState extends State<FarmclubTextInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.farmclubTitle,
                style: FarmusThemeData.darkStyle16,
              ),
              if (widget.isRecommend == false)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child:
                      SvgPicture.asset("assets/image/line_vertical_grey1.svg"),
                ),
              if (widget.isRecommend == false)
                Text(
                  widget.vegetable,
                  style: FarmusThemeData.darkStyle13,
                ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.level,
                style: FarmusThemeData.brownText13,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "${widget.nowPerson}/${widget.maxPerson}명",
                style: FarmusThemeData.darkStyle13,
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.status != "준비 중"
                  ? Text(
                      "시작한 지 ${widget.dday}일째",
                      style: FarmusThemeData.grey1Style11,
                    )
                  : Text(
                      widget.status,
                      style: FarmusThemeData.grey1Style11,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
