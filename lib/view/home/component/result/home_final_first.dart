import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view/home/component/result/home_final_controller.dart';
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
        ],
      ),
    );
  }
}
