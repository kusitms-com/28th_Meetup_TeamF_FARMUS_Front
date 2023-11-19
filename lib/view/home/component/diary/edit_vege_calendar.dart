import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_custom_calendar.dart';

class EditVegeCalendar extends StatefulWidget {
  const EditVegeCalendar({Key? key}) : super(key: key);

  @override
  State<EditVegeCalendar> createState() => _EditVegeCalendarState();
}

class _EditVegeCalendarState extends State<EditVegeCalendar> {
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
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16), // 왼쪽 여백 추가
      child: Align(
        alignment: Alignment.centerLeft, // 오른쪽 정렬
        child: InkWell(
          onTap: _pickStartDate,
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: FarmusThemeData.background,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 16),
                SvgPicture.asset(
                  'assets/image/ic_calendar.svg',
                  color: Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  _startDate == null
                      ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                      : ' ${DateFormat('yyyy-MM-dd').format(_startDate!)}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
