import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/repository/onboarding_repository.dart';

class OnboardingFinish extends StatefulWidget {
  const OnboardingFinish({Key? key}) : super(key: key);

  @override
  _OnboardingFinishState createState() => _OnboardingFinishState();
}

class _OnboardingFinishState extends State<OnboardingFinish> {
  @override
  void initState() {
    super.initState();
    patchComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: MediaQuery.of(context).size.height, // 화면 높이에 맞춤

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2, // 전체 화면 크기의 1/2

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SvgPicture.asset(
                        "assets/image/logo_onboarding.svg",
                        width: 256,
                        height: 256,
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            "assets/image/logo_farmus.svg",
                            width: 85.91,
                            height: 19,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "성취감과 즐거움을 느낄 수 있도록\n파머님의 홈파밍 여정에 함께할게요",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: FarmusThemeData.primary,
                                fontSize: 13,
                                fontFamily: "Pretendard"),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Future<String?> patchComplete() {
    return OnboardingRepository.patchComplete();
  }
}
