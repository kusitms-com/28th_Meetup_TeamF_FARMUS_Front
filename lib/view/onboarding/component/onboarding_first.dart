import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view_model/onboarding_controller.dart';

class OnboardingFirst extends StatefulWidget {
  const OnboardingFirst({Key? key}) : super(key: key);

  @override
  _OnboardingFirstState createState() => _OnboardingFirstState();
}

class _OnboardingFirstState extends State<OnboardingFirst> {
  final OnboardingController _controller = Get.put(OnboardingController());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          SvgPicture.asset("assets/image/ic_profile.svg"),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => TextFormField(
              controller: _controller.controller,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: '닉네임',
                errorText: _controller.hasSpecialCharacters.value
                    ? '특수문자는 입력할 수 없어요'
                    : null,
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
