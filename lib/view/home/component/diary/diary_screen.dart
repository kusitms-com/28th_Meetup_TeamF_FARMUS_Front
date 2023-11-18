import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_app_bar.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_box.dart';
import 'package:mojacknong_android/view/home/component/diary/empty_card.dart';
import 'package:mojacknong_android/view/home/component/diary/write_diary.dart';
import 'package:mojacknong_android/view/home/component/register/customs/register_button.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DiaryAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 244,
            child: DiaryBox(
              nickname: '고훈이',
              imageWidget: SvgPicture.asset("assets/image/lettuce1.svg"),
              age: 43,
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "성장일기",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 4.0),
              children: const [
                EmptyCard(),
              ],
            ),
          ),
          RegisterButton(
            text: '일기 작성하기',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const WriteDiary();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
