import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/main/main_screen.dart';
import 'package:mojacknong_android/view/onboarding/component/next_button.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_finish.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_first.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_fourth.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_second.dart';
import 'package:mojacknong_android/view/onboarding/component/onboarding_third.dart';
import 'package:mojacknong_android/view/onboarding/component/previous_button.dart';
import 'package:mojacknong_android/view/onboarding/component/progress_bar.dart';
import 'package:mojacknong_android/view_model/controllers/onboarding_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 1;
  String title = "안녕하세요! 먼저 프로필을 설정해주세요";
  String description = "";
  late Widget _currentWidget;
  bool isLastPage = false;
  late int time;

  bool isBoxesSelectedCurrentPage2() {
    return _onboardingController.isSelected1.value ||
        _onboardingController.isSelected2.value ||
        _onboardingController.isSelected3.value;
  }

  bool isBoxesSelectedCurrentPage3() {
    return _onboardingController.isSelected4.value ||
        _onboardingController.isSelected5.value ||
        _onboardingController.isSelected6.value;
  }

  bool isBoxesSelectedCurrentPage4() {
    return _onboardingController.isSelected7.value ||
        _onboardingController.isSelected8.value ||
        _onboardingController.isSelected9.value ||
        _onboardingController.isSelected10.value;
  }

  final OnboardingController _onboardingController =
      Get.put(OnboardingController());

  @override
  void initState() {
    super.initState();
    _currentWidget = OnboardingFirst();
  }

  bool showPreviousButton = true;
  void _handleButtonPress(bool isNext) {
    setState(
      () {
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
          title = "안녕하세요! 먼저 프로필을 설정해주세요";
          description = "";
          _currentWidget = OnboardingFirst();
          showPreviousButton = false;
        } else if (_currentPage == 2) {
          title = "홈파밍을 하는 이유가 궁금해요!";
          description = "그에 맞는 응원 메시지를 전해드릴게요";
          _currentWidget = OnboardingSecond();
          showPreviousButton = true;
        } else if (_currentPage == 3) {
          title = "홈파밍에 시간을 얼마나 쓸 수 있나요?";
          description = "기를 채소를 고르지 못했다면 팜어스가 추천해드릴게요";
          _currentWidget = OnboardingThird();
          showPreviousButton = true;
        } else if (_currentPage == 4) {
          title = "채소를 얼마나 잘 기르시나요?";
          description = "기를 채소를 고르지 못했다면 팜어스가 추천해드릴게요";
          _currentWidget = OnboardingFourth();
          showPreviousButton = true;
        } else if (_currentPage == 5) {
          title = "파머님 가입이 완료되었어요!";
          description = "홈에서 추천 채소를 확인해보세요";
          _currentWidget = OnboardingFinish();
          showPreviousButton = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  color: FarmusThemeData.dark,
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
                  color: FarmusThemeData.dark,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: _currentWidget,
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentPage != 5 &&
                        _currentPage != 1 &&
                        showPreviousButton)
                      Expanded(
                        child: PreviousButton(
                          onPressed: () => _handleButtonPress(false),
                        ),
                      ),
                    Expanded(
                      child: NextButton(
                        text: _currentPage == 5
                            ? "시작하기"
                            : _currentPage == 2 &&
                                    !isBoxesSelectedCurrentPage2()
                                ? "건너뛰기"
                                : "다음",
                        onPressed: () => _handleButtonPress(true),
                        // 버튼 활성화 유무 결정
                        enabled: _currentPage == 1
                            // 특수문자, 닉네임 입력
                            ? _onboardingController.hasInput.value &&
                                !_onboardingController
                                    .hasSpecialCharacters.value
                            : _currentPage == 2
                                // 2페이지는 건너뛰기, 다음버튼으로 항상 활성화
                                ? true
                                // 박스 하나라도 선택하면 버튼 활성화
                                : _currentPage == 3
                                    ? isBoxesSelectedCurrentPage3()
                                    : _currentPage == 4
                                        ? isBoxesSelectedCurrentPage4()
                                        : _currentPage == 5
                                            ? true
                                            : false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
