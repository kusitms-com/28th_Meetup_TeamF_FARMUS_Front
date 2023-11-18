import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_custom_calendar.dart';

class DiaryCalendar extends StatefulWidget {
  const DiaryCalendar({Key? key}) : super(key: key);

  @override
  State<DiaryCalendar> createState() => _DiaryCalendarState();
}

class _DiaryCalendarState extends State<DiaryCalendar> {
  DateTime? _startDate;

  Future<void> _pickStartDate() async {
    final DateTime? selectedDate = await showDialog<DateTime>(
      context: context,
      builder: (context) => Dialog(
        child: Material(
          type: MaterialType.transparency, //배경 투명하게 설정
          child: DiaryCustomCalendar(
            initialDate: _startDate ?? DateTime.now(),
          ),
        ),
      ),
    );

    if (selectedDate != null && selectedDate != _startDate) {
      setState(() {
        _startDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickStartDate, // Triggers CustomCalendar
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 220, left: 5),
        decoration: BoxDecoration(
          color: FarmusThemeData.background,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _startDate == null
                ? SvgPicture.asset('assets/image/ic_calendar.svg')
                : SvgPicture.asset('assets/image/ic_calendar.svg'),
            const SizedBox(width: 8),
            Text(
              _startDate == null
                  ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                  : ' ${DateFormat('yyyy-MM-dd').format(_startDate!)}',
            ),
          ],
        ),
      ),
    );
  }
}
