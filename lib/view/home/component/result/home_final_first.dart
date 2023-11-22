// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view/home/component/result/home_final_controller.dart';
// ignore: unused_import
import 'package:mojacknong_android/view/home/component/result/home_final_second.dart';
import 'package:mojacknong_android/view/home/component/result/home_final_third.dart';
import 'package:mojacknong_android/view/home/component/result/home_next_botton.dart';
import 'package:mojacknong_android/view/home/component/result/home_select_box.dart';

class HomeFinalFirst extends StatefulWidget {
  const HomeFinalFirst({Key? key}) : super(key: key);

  @override
  _HomeFinalFirst createState() => _HomeFinalFirst();
}

class _HomeFinalFirst extends State<HomeFinalFirst> {
  final HomeFinalController _homeFinalController =
      Get.put(HomeFinalController());

  List<String> result = [];

  @override
  void dispose() {
    // postDone();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              _homeFinalController.pickBox1();
              updateResult();
            },
            child: HomeSelectBox(
              title: "채소 재배에 성공했어요",
              isSelected: _homeFinalController.isTaped1,
              selectBox: () {
                _homeFinalController.pickBox1();
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              _homeFinalController.pickBox2();
              updateResult();
            },
            child: HomeSelectBox(
              title: "채소 재배에 실패했어요",
              isSelected: _homeFinalController.isTaped2,
              selectBox: () {
                _homeFinalController.pickBox2();
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // Expanded(
          //   child: Obx(
          //     () => HomeNextButton(
          //       text: '다음',
          //       onPressed: () {
          //         if (_homeFinalController.isTaped1.value) {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const HomeFinalSecond(),
          //             ),
          //           );
          //         } else if (_homeFinalController.isTaped2.value) {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const HomeFinalThird(),
          //             ),
          //           );
          //         }
          //       },
          //       enabled: _homeFinalController.isTaped1.value ||
          //           _homeFinalController.isTaped2.value,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void updateResult() {
    result = [];
    if (_homeFinalController.isTaped1.value) {
      result.add("채소 재배 성공");
    } else {
      result.remove("채소 재배 성공");
    }
    if (_homeFinalController.isTaped2.value) {
      result.add("채소 재배 실패");
    } else {
      result.remove("채소 재배 실패");
    }
  }

  // Future<String> postDone() {
  //   print(result);
  //   return HomeFinalRepository.postDone(result);
  // }
}
