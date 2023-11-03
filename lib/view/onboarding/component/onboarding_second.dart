import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/onboarding/component/select_box.dart';

class OnboardingSecond extends StatefulWidget {
  const OnboardingSecond({Key? key}) : super(key: key);

  @override
  _OnboardingSecond createState() => _OnboardingSecond();
}

class _OnboardingSecond extends State<OnboardingSecond> {
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
            child: const SelectBox(
              title: "채솟값을 절약하고 싶어요",
              content: "물가가 올라서 채솟값을 절약하고 싶어요",
            ),
          ),
          GestureDetector(
            child: const SelectBox(
              title: "신선하고 안전한 식재료를 얻고 싶어요",
              content: "직접 키운 작물로 신선한 요리를 만들고 싶어요",
            ),
          ),
          GestureDetector(
            child: const SelectBox(
              title: "스트레스를 해소하고 안정을 얻고 싶어요",
              content: "홈파밍을 통해 정서적 안정이 필요해요",
            ),
          ),
        ],
      ),
    );
  }
}
