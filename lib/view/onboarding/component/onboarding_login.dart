import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view_model/onboarding_controller.dart';

class OnboardingLogin extends StatefulWidget {
  const OnboardingLogin({Key? key}) : super(key: key);

  @override
  _OnboardingLoginState createState() => _OnboardingLoginState();
}

class _OnboardingLoginState extends State<OnboardingLogin> {
  final OnboardingController _controller = Get.put(OnboardingController());

  @override
  void dispose() {
    _controller.dispose();
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
          SvgPicture.asset("assets/image/ic_onboarding_profile.svg"),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _controller.controller,
            maxLength: 10,
            decoration: InputDecoration(
              labelText: '닉네임',
              errorText:
                  _controller.hasSpecialCharacters ? '특수문자는 입력할 수 없어요' : null,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
