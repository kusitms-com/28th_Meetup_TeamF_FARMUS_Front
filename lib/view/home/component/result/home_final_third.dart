// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/result/home_final_controller.dart';
import 'package:mojacknong_android/view/home/component/result/home_final_dialog.dart';
import 'package:mojacknong_android/view/home/component/result/home_final_first.dart';
import 'package:mojacknong_android/view/home/component/result/home_next_botton.dart';
import 'package:mojacknong_android/view/home/component/result/home_select_box.dart';
import 'package:mojacknong_android/view/main/main_screen.dart';
import 'package:mojacknong_android/view/onboarding/component/previous_button.dart';

class HomeFinalThird extends StatefulWidget {
  const HomeFinalThird({Key? key}) : super(key: key);

  @override
  _HomeFinalThird createState() => _HomeFinalThird();
}

class _HomeFinalThird extends State<HomeFinalThird> {
  final HomeFinalController _homeFinalController =
      Get.put(HomeFinalController());

  List<String> motivation = [];

  @override
  void dispose() {
    // postDone();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("실패 화면");
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () {
              _homeFinalController.pickBox3();
              // updateResult();
            },
            child: HomeSelectBox(
              title: "커뮤니티에서 도움 받아볼래요",
              isSelected: _homeFinalController.isTaped3,
              selectBox: () {
                _homeFinalController.pickBox3();
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              _homeFinalController.pickBox4();
              // updateResult();
            },
            child: HomeSelectBox(
              title: "괜찮아요, 이대로 종료할게요",
              isSelected: _homeFinalController.isTaped4,
              selectBox: () {
                _homeFinalController.pickBox4();
              },
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: PreviousButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomeFinalFirst();
                        },
                      ),
                    );
                  },
                ),
              ),
              // Expanded(
              //   child: Obx(
              //     () => HomeNextButton(
              //       text: '다음',
              //       onPressed: () {
              //         if (_homeFinalController.isTaped3.value) {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => const MainScreen(),
              //             ),
              //           );
              //         } else if (_homeFinalController.isTaped4.value) {
              //           showHomeFinalDialog(context);
              //         }
              //       },
              //       enabled: _homeFinalController.isTaped3.value ||
              //           _homeFinalController.isTaped4.value,
              //     ),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }

  void showHomeFinalDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: FarmusThemeData.grey1,
      builder: (BuildContext context) {
        return const HomeFinalDialog();
      },
    );
  }

  // void updateResult() {
  //   motivation = [];
  //   if (_homeFinalController.isTaped3.value) {
  //     motivation.add("커뮤니티 탭으로 이동");
  //   } else {
  //     motivation.remove("커뮤니티 탭으로 이동");
  //   }
  //   if (_homeFinalController.isTaped4.value) {
  //     motivation.add("종료");
  //   } else {
  //     motivation.remove("종료");
  //   }
  // }

  // Future<String> postDone() {
  //   print(motivation);
  //   return HomeFinalRepository.postDone(motivation);
  // }
}
