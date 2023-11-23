import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class DiaryCalendarNoTap extends StatefulWidget {
  const DiaryCalendarNoTap({Key? key}) : super(key: key);

  @override
  State<DiaryCalendarNoTap> createState() => _DiaryCalendarNoTapState();
}

class _DiaryCalendarNoTapState extends State<DiaryCalendarNoTap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 220, left: 5),
      decoration: BoxDecoration(
        color: FarmusThemeData.background,
        border: Border.all(
          color: FarmusThemeData.background,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            'assets/image/ic_calendar.svg',
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            DateFormat('yyyy/MM/dd').format(DateTime.now()),
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}