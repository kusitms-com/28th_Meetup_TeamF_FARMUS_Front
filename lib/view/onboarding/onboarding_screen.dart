import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/onboarding/component/next_button.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_login.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_second.dart'; // Importing OnboardingSecond
import 'package:mojacknong_android/view/onboarding/component/previous_button.dart';
import 'package:mojacknong_android/view/onboarding/component/progress_bar.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String title = "프로필과 나의 닉네임을 정해주세요.";
  String description = "";
  bool isOnboardingLogin = true;

  void _changeContent() {
    setState(() {
      if (isOnboardingLogin) {
        title = "홈파밍을 하는 이유가 궁금해요!";
        description = "내 홈파밍 동기에 맞는 응원 메시지를 전해드릴게요.";
      } else {
        title = "프로필과 나의 닉네임을 정해주세요.";
        description = "";
      }
      isOnboardingLogin = !isOnboardingLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: ProgressBar(),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontFamily: "Pretendard"),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Text(
                description,
                style: const TextStyle(fontSize: 14, fontFamily: "Pretendard"),
                textAlign: TextAlign.start,
              ),
            ),
            isOnboardingLogin
                ? const Expanded(child: OnboardingLogin())
                : const Expanded(
                    child: OnboardingSecond(),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PreviousButton(
                      onPressed: _changeContent,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: NextButton(
                      onPressed: _changeContent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
