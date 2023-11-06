import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view/onboarding/component/select_box.dart';
import 'package:mojacknong_android/view_model/controllers/onboarding_controller.dart';

class OnboardingSecond extends StatefulWidget {
  const OnboardingSecond({Key? key}) : super(key: key);

  @override
  _OnboardingSecond createState() => _OnboardingSecond();
}

class _OnboardingSecond extends State<OnboardingSecond> {
  final OnboardingController _onboardingController =
      Get.put(OnboardingController());
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
              _onboardingController.selectBox1();
            },
            child: SelectBox(
              title: "채솟값을 절약하고 싶어요",
              content: "물가가 올라서 채솟값을 절약하고 싶어요",
              isSelected: _onboardingController.isSelected1,
            ),
          ),
          GestureDetector(
            onTap: () {
              _onboardingController.selectBox2();
            },
            child: SelectBox(
              title: "신선하고 안전한 식재료를 얻고 싶어요",
              content: "직접 키운 작물로 신선한 요리를 만들고 싶어요",
              isSelected: _onboardingController.isSelected2,
            ),
          ),
          GestureDetector(
            onTap: () {
              _onboardingController.selectBox3();
            },
            child: SelectBox(
              title: "스트레스를 해소하고 안정을 얻고 싶어요",
              content: "홈파밍을 통해 정서적 안정이 필요해요",
              isSelected: _onboardingController.isSelected3,
            ),
          ),
        ],
      ),
    );
  }
}
