import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/home_custom_app_bar.dart';
import 'package:mojacknong_android/view/home/component/home_divider.dart';
import 'package:mojacknong_android/view/home/controller/home_content.dart';
import 'package:mojacknong_android/view/home/controller/home_swipe.dart';
import 'package:mojacknong_android/view/home/detail/checkboxlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('Building HomeScreen');
    return Scaffold(
      appBar: const HomeCustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 390,
            child: SwipeScreen(),
          ),
          const SizedBox(height: 10),
          const HomeDivider(),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "팜클럽 미션",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 4.0),
              children: const [
                HomeContent(),
                HomeContent(),
                HomeContent(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "오늘의 루틴",
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const CheckboxList(
            items: [
              '물 갈아 주기',
              '하루에 물 한 번 주기',
              '하루에 물 두 번 주기',
            ],
          ),
        ],
      ),
    );
  }
}
