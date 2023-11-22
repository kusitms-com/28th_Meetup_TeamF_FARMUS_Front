import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/custom_app_bar.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/diary/diary_post_controller.dart';
import 'package:mojacknong_android/view/home/component/result/home_final_controller.dart';
import 'package:mojacknong_android/view/home/component/result/home_final_dialog.dart';
import 'package:mojacknong_android/view/home/component/result/home_final_first.dart';
import 'package:mojacknong_android/view/home/component/result/home_final_second.dart';
import 'package:mojacknong_android/view/home/component/result/home_final_third.dart';
import 'package:mojacknong_android/view/home/component/result/home_next_botton.dart';
import 'package:mojacknong_android/view/home/component/result/home_text_controller.dart';
import 'package:mojacknong_android/view/main/main_screen.dart';
import 'package:mojacknong_android/view/onboarding/component/previous_button.dart';
import 'package:mojacknong_android/view/onboarding/component/progress_bar.dart';

class HomeFinalScreen extends StatefulWidget {
  const HomeFinalScreen({Key? key}) : super(key: key);

  @override
  State<HomeFinalScreen> createState() => _HomeFinalScreenState();
}

class _HomeFinalScreenState extends State<HomeFinalScreen> {
  int _currentPage = 1;
  String title = "채소를 삭제하는 이유를 알려주세요";

  String description = "채소를 삭제하면 내 텃밭이 사라져요";
  late Widget _currentWidget;
  bool isLastPage = false;
  late int time;
  final DiaryPostController diaryPostController =
      Get.put(DiaryPostController());

  bool isBoxesPage1() {
    return _homeFinalController.isTaped1.value ||
        _homeFinalController.isTaped2.value;
  }

  bool isBoxesPage2() {
    return _homeFinalController.isTaped3.value ||
        _homeFinalController.isTaped4.value;
  }

  bool isBoxesPage3() {
    return _homeFinalController.isTaped5.value ||
        _homeFinalController.isTaped6.value;
  }

  final HomeFinalController _homeFinalController =
      Get.put(HomeFinalController());
  final HomeTextController homeTextController = Get.put(HomeTextController());

  @override
  void initState() {
    super.initState();
    _currentWidget = const HomeFinalFirst();
  }

  bool showPreviousButton = true;
  void _isButtonPress(bool isNext) {
    setState(
      () {
        if (_currentPage == 1 && _homeFinalController.isTaped2.value) {
          _currentPage = 3;
          _currentWidget = const HomeFinalThird();
          title = "채소 재배에 어려움을 겪고 있나요?\n커뮤니티에서 도움을 얻을 수 있어요";
          description = "홈파밍을 도중에 중단하는 경우\n채소 히스토리에 등록되지 않아요";
        } else {
          if (_currentPage < 3) {
            _currentPage += 1;
          } else {
            isLastPage = true;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainScreen()));
            return;
          }
        }

        isLastPage = false;

        if (_currentPage == 1) {
          title = "채소를 삭제하는 이유를 알려주세요";
          description = "채소를 삭제하면 내 텃밭이 사라져요";
          _currentWidget = const HomeFinalFirst();
          showPreviousButton = false;
        } else if (_currentPage == 2) {
          title = "채소 히스토리에 등록될\n재배 결과를 기록해주세요!";
          description = "마이페이지에서 나중에 등록할 수 있어요";
          _currentWidget = const HomeFinalSecond();
          showPreviousButton = true;
        } else if (_currentPage == 3) {
          title = "채소 재배에 어려움을 겪고 있나요?\n커뮤니티에서 도움을 얻을 수 있어요";
          description = "홈파밍을 도중에 중단하는 경우\n채소 히스토리에 등록되지 않아요";
          _currentWidget = const HomeFinalThird();
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
        backgroundColor: FarmusThemeData.white,
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
                    if (_currentPage != 4 &&
                        _currentPage > 1 &&
                        showPreviousButton)
                      Expanded(
                        child: PreviousButton(
                          onPressed: () => _isButtonPress(false),
                        ),
                      ),
                    Expanded(
                      child: HomeNextButton(
                        text: _currentPage == 1
                            ? "다음"
                            : _currentPage == 2 &&
                                    homeTextController
                                        .contentValue.value.isNotEmpty
                                ? "완료"
                                : "나중에 등록하기",
                        onPressed: () {
                          if (_currentPage == 2 &&
                              homeTextController
                                  .contentValue.value.isNotEmpty) {
                            showHomeFinalDialog(context); // 여기서 필요한 다이얼로그 호출
                          } else {
                            _isButtonPress(true);
                          }
                        },
                        enabled: _currentPage == 1
                            ? isBoxesPage1()
                            : _currentPage == 2
                                ? homeTextController
                                    .contentValue.value.isNotEmpty
                                : _currentPage == 3
                                    ? isBoxesPage2()
                                    : _currentPage == 4
                                        ? true
                                        : false,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showHomeFinalDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: FarmusThemeData.grey1,
    builder: (BuildContext context) {
      return const HomeFinalDialog();
    },
  );
}
