import 'package:flutter/material.dart';
import 'package:mojacknong_android/view/onboarding/component/next_button.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_finish.dart'; // Importing OnboardingFinish
import 'package:mojacknong_android/view/onboarding/component/onboarding_first.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_fourth.dart'; // Importing OnboardingFourth
import 'package:mojacknong_android/view/onboarding/component/onboarding_second.dart'; // Importing OnboardingSecond
import 'package:mojacknong_android/view/onboarding/component/onboarding_third.dart'; // Importing OnboardingThird
import 'package:mojacknong_android/view/onboarding/component/previous_button.dart';
import 'package:mojacknong_android/view/onboarding/component/progress_bar.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 1;
  late Widget _currentWidget;

  @override
  void initState() {
    super.initState();
    _currentWidget = OnboardingFirst();
  }

  void _changeContent() {
    setState(() {
      if (_currentPage < 5) {
        _currentPage += 1;
        if (_currentPage == 2) {
          _currentWidget = OnboardingSecond();
        } else if (_currentPage == 3) {
          _currentWidget = OnboardingThird();
        } else if (_currentPage == 4) {
          _currentWidget = OnboardingFourth();
        } else {
          _currentWidget = OnboardingFinish();
        }
      }
    });
  }

  void _goBack() {
    setState(() {
      if (_currentPage > 1) {
        _currentPage -= 1;
        if (_currentPage == 1) {
          _currentWidget = OnboardingFirst();
        } else if (_currentPage == 2) {
          _currentWidget = OnboardingSecond();
        } else if (_currentPage == 3) {
          _currentWidget = OnboardingThird();
        } else {
          _currentWidget = OnboardingFourth();
        }
      }
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
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ProgressBar(currentPage: _currentPage),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: _currentWidget,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage != 1)
                    Expanded(
                      child: PreviousButton(
                        onPressed: _goBack,
                      ),
                    ),
                  if (_currentPage != 5) const SizedBox(width: 16),
                  if (_currentPage != 5)
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
