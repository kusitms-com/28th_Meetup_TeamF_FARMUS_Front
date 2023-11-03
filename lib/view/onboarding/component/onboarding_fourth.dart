import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view/onboarding/component/select_box.dart';
import 'package:mojacknong_android/view_model/onboarding_controller.dart';

class OnboardingFourth extends StatefulWidget {
  const OnboardingFourth({Key? key}) : super(key: key);

  @override
  _OnboardingFourth createState() => _OnboardingFourth();
}

class _OnboardingFourth extends State<OnboardingFourth> {
  OnboardingController _onboardingController = Get.put(OnboardingController());
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
              _onboardingController.selectBox7();
            },
            child: SelectBox(
              title: "초심자",
              content: "홈파밍이 처음이에요",
              isSelected: _onboardingController.isSelected7,
            ),
          ),
          GestureDetector(
            onTap: () {
              _onboardingController.selectBox8();
            },
            child: SelectBox(
              title: "경험자",
              content: "시도한 적은 있지만 성공하진 못했어요",
              isSelected: _onboardingController.isSelected8,
            ),
          ),
          GestureDetector(
            onTap: () {
              _onboardingController.selectBox9();
            },
            child: SelectBox(
              title: "증급자",
              content: "작물을 잘 관리하고 재배하는 법을 알고 있어요",
              isSelected: _onboardingController.isSelected9,
            ),
          ),
          GestureDetector(
            onTap: () {
              _onboardingController.selectBox10();
            },
            child: SelectBox(
              title: "고수",
              content: "홈파밍 전문가 수준이에요",
              isSelected: _onboardingController.isSelected10,
            ),
          ),
        ],
      ),
    );
  }
}
