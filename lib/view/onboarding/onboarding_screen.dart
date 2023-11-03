import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/view/main/main_screen.dart';
import 'package:mojacknong_android/view/onboarding/component/next_button.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_finish.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_first.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_fourth.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_second.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_third.dart';
import 'package:mojacknong_android/view/onboarding/component/previous_button.dart';
import 'package:mojacknong_android/view/onboarding/component/progress_bar.dart';
import 'package:mojacknong_android/view_model/onboarding_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 1;
  String title = "프로필과 나의 닉네임을 정해주세요.";
  String description = "";
  late Widget _currentWidget;
  bool isLastPage = false;

  final OnboardingController _onboardingController =
      Get.put(OnboardingController());

  @override
  void initState() {
    super.initState();
    _currentWidget = OnboardingFirst();
  }

  void _handleButtonPress(bool isNext) {
    setState(() {
      if (isNext) {
        if (_currentPage < 5) {
          _currentPage += 1;
        } else {
          isLastPage = true;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
          return;
        }
      } else {
        if (_currentPage > 1) {
          _currentPage -= 1;
        } else {
          return;
        }
      }

      isLastPage = false;

      if (_currentPage == 1) {
        title = "프로필과 나의 닉네임을 정해주세요.";
        description = "";
        _currentWidget = OnboardingFirst();
      } else if (_currentPage == 2) {
        title = "홈파밍을 하는 이유가 궁금해요!";
        description = "내 홈파밍 동기에 맞는 응원 메시지를 전해드릴게요";
        _currentWidget = OnboardingSecond();
      } else if (_currentPage == 3) {
        title = "작물과 함께 할 수 있는 시간을 알려주세요!";
        description = "아직 작물을 고르지 못했다면 팜어스가 추천해드릴게요";
        _currentWidget = OnboardingThird();
      } else if (_currentPage == 4) {
        title = "작물을 얼마나 잘 기르시나요?";
        description = "아직 작물을 고르지 못했다면 팜어스가 추천해드릴게요";
        _currentWidget = OnboardingFourth();
      } else if (_currentPage == 5) {
        title = "파머님 가입이 완료되었어요!";
        description = "홈에서 추천 작물을 확인해보세요";
        _currentWidget = OnboardingFinish();
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
              child: ProgressBar(
                currentPage: _currentPage,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Pretendard",
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Pretendard",
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: _currentWidget,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage != 5)
                    Expanded(
                      child: PreviousButton(
                        onPressed: () => _handleButtonPress(false),
                      ),
                    ),
                  Expanded(
                    child: Obx(
                      () => NextButton(
                        onPressed: () => _handleButtonPress(true),
                        enabled: _onboardingController.hasInput.value,
                      ),
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
