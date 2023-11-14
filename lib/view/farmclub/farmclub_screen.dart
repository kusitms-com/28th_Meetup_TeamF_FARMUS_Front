import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
<<<<<<< HEAD
import 'package:mojacknong_android/view/farmclub/component/farmclub_title.dart';
import 'package:mojacknong_android/view/farmclub/component/group_rate.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub_info.dart';
import 'package:mojacknong_android/view/farmclub/component/my_farmclub_list.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_explore_screen.dart';
=======
import 'package:mojacknong_android/view/farmclub/component/my_farmclub_list.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_%20explore_screen.dart';
>>>>>>> 1e6e0bd ([feat] : 나의 팜클럽 리스트 구현 (#34))

class FarmclubScreen extends StatefulWidget {
  @override
  State<FarmclubScreen> createState() => _FarmclubScreenState();
}

class _FarmclubScreenState extends State<FarmclubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "나의 팜클럽",
                  style: TextStyle(
                    color: FarmusThemeData.dark,
                    fontFamily: "Pretendard",
                    fontSize: 16,
                  ),
                ),
                Bouncing(
                  onPress: () {},
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FarmclubExploreScreen();
                          },
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/image/ic_search.svg",
                    ),
                  ),
                ),
              ],
            ),
          ),
          MyFarmclubList(),
<<<<<<< HEAD
          SizedBox(
            height: 16,
          ),
          FarmclubTitle(),
          SizedBox(
            height: 8,
          ),
          MyFarmclubInfo(),
          GroupRate(),
=======
>>>>>>> 1e6e0bd ([feat] : 나의 팜클럽 리스트 구현 (#34))
        ],
      ),
    );
  }
}
