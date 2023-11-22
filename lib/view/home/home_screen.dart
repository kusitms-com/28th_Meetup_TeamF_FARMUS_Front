import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/mission_routine/mission_routine_screen.dart';
import 'package:mojacknong_android/view/home/detail/home_custom_app_bar.dart';
import 'package:mojacknong_android/view/home/detail/home_swipe.dart';
import 'package:mojacknong_android/view/home/home_with_data.dart';
import 'package:mojacknong_android/view_model/controllers/farmclub/farmclub_etc_controller.dart';
import '../../model/current_mission_list.dart';
import '../../model/my_vege_list.dart';
import '../../model/my_vege_routine_list.dart';
import '../../repository/homescreen_repository.dart';
import 'home_difficulty/home_vege_difficult.dart';
import 'home_difficulty/home_vege_easy.dart';
import 'home_difficulty/home_vege_normal.dart';
import 'home_without_vege.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FarmclubEtcController controller = Get.put(FarmclubEtcController());
  @override
  Widget build(BuildContext context) {
    print('Building HomeScreen');
    return  Scaffold(
      appBar: const HomeCustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: FutureBuilder(
        future: HomeScreenRepository.getHomePageData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("화면 로딩 중");
            return const Center(
              child: CircularProgressIndicator(
                color: FarmusThemeData.background,
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {


            final List<dynamic> data = snapshot.data as List<dynamic>;
            final MyVegeList? myVegeList  = data[0] as MyVegeList?;
            final CurrentMissionList? currentMissionList = data[1] as CurrentMissionList?;
            final MyVegeRoutineList? myVegeRoutineList = data[2] as MyVegeRoutineList?;

            print(myVegeList?.level);


            if(myVegeList!.diaryPostList.isEmpty){
              return setView(levelSign(myVegeList.level, myVegeList.userNickname), HomeWithoutVege());
            }
            return setView( SwipeScreen(
              myVegeList: myVegeList,

            ),
                HomeWithVege( currentMissionList: currentMissionList,
              myVegeRoutineList: myVegeRoutineList,

            ));



          }
        },
      ),
    );


  }





  Widget levelSign(String? level, String? nickName){

    if(level == "EASY"){
      return HomeVegeEasy(
        name: nickName,
      );
    }else if(level == "NORMAL"){
      return HomeVegeNormal(
        name: nickName,
      );
    }else if(level == "HARD"){
      return HomeVegeDif(
        name: nickName,
      );
    }

    return HomeVegeEasy();
  }

  SingleChildScrollView setView<T extends Widget>(T isVegeClass, T noTextClass) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 390,
            color: FarmusThemeData.white,
            child: isVegeClass,
          ),
          const SizedBox(height: 10),
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
                          builder: (context) =>
                          const MissionRoutineScreen(),
                        ),
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
          SizedBox(height: 300, child: noTextClass),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}