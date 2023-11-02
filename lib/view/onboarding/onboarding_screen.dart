import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/onboarding/component/next_button.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 36,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: ProgressBar(),
            ),
            Expanded(child: Container()),
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
