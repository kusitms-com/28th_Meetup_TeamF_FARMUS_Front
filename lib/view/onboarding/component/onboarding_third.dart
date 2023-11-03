import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/onboarding/component/select_box.dart';

class OnboardingThird extends StatefulWidget {
  const OnboardingThird({Key? key}) : super(key: key);

  @override
  _OnboardingThird createState() => _OnboardingThird();
}

class _OnboardingThird extends State<OnboardingThird> {
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
              title: "홈파밍에 많은 시간을 쓸 수 있어요",
              content: "1시간 이상",
            ),
          ),
          GestureDetector(
            child: const SelectBox(
              title: "아침 저녁으로 홈파밍을 할 수 있어요",
              content: "30분 이상",
            ),
          ),
          GestureDetector(
            child: const SelectBox(
              title: "하루 일과를 마치면시간이 촉박해요",
              content: "30분 미만",
            ),
          ),
        ],
      ),
    );
  }
}
