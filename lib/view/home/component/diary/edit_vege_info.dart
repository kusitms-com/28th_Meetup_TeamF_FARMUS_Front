import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/diary/edit_vege_app_bar.dart';
import 'package:mojacknong_android/view/home/component/diary/edit_vege_button.dart';
import 'package:mojacknong_android/view/home/component/diary/edit_vege_calendar.dart';
import 'package:mojacknong_android/view/home/component/register/nickname_vege.dart';

class EditVegeInfo extends StatefulWidget {
  const EditVegeInfo({Key? key}) : super(key: key);

  @override
  State<EditVegeInfo> createState() => _EditVegeInfoState();
}

class _EditVegeInfoState extends State<EditVegeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EditVegeAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: const Text(
              '이름',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ),
          const SizedBox(
            height: 100,
            child: NickNameVege(),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: const Text(
              '키우기 시작한 날',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const EditVegeCalendar(),
          Expanded(
            child: Align(
              alignment: Alignment.center, // 하단 중앙 정렬
              child: EditButton(
                text: '수정하기',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
