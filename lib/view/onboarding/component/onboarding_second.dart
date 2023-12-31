import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/repository/onboarding_repository.dart';
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

  List<String> motivation = [];

  @override
  void dispose() {
    postMotivation();
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
              _onboardingController.selectBox1();
              updateMotivation();
            },
            child: SelectBox(
              title: "채솟값을 절약하고 싶어요",
              content: "물가가 올라서 집에서 직접 길러 먹으려고 해요",
              isSelected: _onboardingController.isSelected1,
            ),
          ),
          GestureDetector(
            onTap: () {
              _onboardingController.selectBox2();
              updateMotivation();
            },
            child: SelectBox(
              title: "신선하고 안전한 식재료를 얻고 싶어요",
              content: "직접 키워서 먹으면 안심이 될 것 같아요",
              isSelected: _onboardingController.isSelected2,
            ),
          ),
          GestureDetector(
            onTap: () {
              _onboardingController.selectBox3();
              updateMotivation();
            },
            child: SelectBox(
              title: "스트레스를 해소하고 안정을 얻고 싶어요",
              content: "자라나는 채소를 보며 마음의 안정을 찾으려고 해요",
              isSelected: _onboardingController.isSelected3,
            ),
          ),
        ],
      ),
    );
  }

  void updateMotivation() {
    motivation = [];
    if (_onboardingController.isSelected1.value) {
      motivation.add("채소값 절약");
    } else {
      motivation.remove("채소값 절약");
    }
    if (_onboardingController.isSelected2.value) {
      motivation.add("신선하고 안전한 식재료");
    } else {
      motivation.remove("신선하고 안전한 식재료");
    }
    if (_onboardingController.isSelected3.value) {
      motivation.add("스트레스 해소 및 안정");
    } else {
      motivation.remove("스트레스 해소 및 안정");
    }
  }

  Future<String> postMotivation() {
    print(motivation);
    return OnboardingRepository.postMotivation(motivation);
  }
}
