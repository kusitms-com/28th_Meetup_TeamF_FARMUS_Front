import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/mission_routine_screen.dart';
import 'package:mojacknong_android/view/home/detail/home_custom_app_bar.dart';
import 'package:mojacknong_android/view/home/detail/home_swipe.dart';
import 'package:mojacknong_android/view/home/home_with_data.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FarmclubController controller = Get.put(FarmclubController());
  @override
  Widget build(BuildContext context) {
    print('Building HomeScreen');
    return Scaffold(
      appBar: const HomeCustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //HomeDivider()부분은 항상 존재
          //작물이 있으면 SwipeScreen() 호출 후, home_with_vege.dart의 HomeWithVege() 호출
          //작물이 없으면 home_difficulty파일에 있는 난이도 별 class 호출 후, home_with_vege.dart의 HomeWithoutVege() 호출
          Container(
            height: 390,
            color: FarmusThemeData.white,
            child: const SwipeScreen(),
            // child: const HomeVegeEasy(),
          ),
          const SizedBox(height: 10),
          // 아래 위젯은 home_divider.dart에 있음
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 36,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '미션/루틴',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MissionRoutineScreen()),
                      );
                    },
                    child: SizedBox(
                      child: SvgPicture.asset(
                        "assets/image/ic_calendar.svg",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 8),
                Divider(
                  color: FarmusThemeData.grey2,
                  height: 1,
                  thickness: 1,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),

          const SizedBox(height: 10),

          const Expanded(child: HomeWithVege()) // 작물 있을 때 호출
          //const Expanded(child: HomeWithoutVege()) //작물 없을 때 호출
        ],
      ),
    );
  }
}
