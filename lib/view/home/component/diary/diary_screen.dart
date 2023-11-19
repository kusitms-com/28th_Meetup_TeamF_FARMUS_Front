import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_app_bar.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_box.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_card.dart';
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
            //만약 일기 썼던 데이터가 없으면 empty_card.dart의 EmptyCard() 호출
            child: ListView(
              padding: const EdgeInsets.only(top: 4.0),
              children: const [
                DiaryCard(
                  inputDate: '2023/11/25',
                  imagePath: 'assets/image/mydiaryimage.svg',
                  textContent:
                      '우리 상추이가 쑥쑥 자라고 있네? 얼른 다 자라서 상추샌드위치 만들어 먹고 싶다상추샌드위치 만들어 먹고 싶다상추샌드위치 만들어 먹고 싶다',
                ),
                DiaryCard(
                  inputDate: '2023/11/05',
                  imagePath: 'assets/image/mydiaryimage.svg',
                  textContent:
                      '우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기대된다~~우리 상훈이가 쑥쑥 자라고 있네? 얼른 다 자라서 삼겹살이랑 쌈장 마늘 해서 상추쌈 싸먹고 싶다. 기',
                ),
                DiaryCard(
                  inputDate: '2023/11/25',
                  imagePath: 'assets/image/mydiaryimage.svg',
                  textContent:
                      '우리 상추이가 쑥쑥 자라고 있네? 얼른 다 자라서 상추샌드위치 만들어 먹고 싶다상추샌드위치 만들어 먹고 싶다상추샌드위치 만들어 먹고 싶다...',
                )
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
