import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/onboarding/component/next_button.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_login.dart';
import 'package:mojacknong_android/view/onboarding/component/previous_button.dart';
import 'package:mojacknong_android/view/onboarding/component/progress_bar.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    String title = "프로필과 나의 닉네임을 정해주세요.";
    String description;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: ProgressBar(),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontFamily: "Pretendard"),
              textAlign: TextAlign.start,
            ),
            const Expanded(
              child: OnboardingLogin(),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PreviousButton(),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: NextButton(),
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
