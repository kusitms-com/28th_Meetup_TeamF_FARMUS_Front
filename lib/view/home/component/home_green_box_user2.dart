import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class HomeGreenBoxUser2 extends StatelessWidget {
  const HomeGreenBoxUser2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: 470,
          height: 380,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 0,
                child: SvgPicture.asset(
                  'assets/image/bigbox.svg',
                ),
              ),
              Positioned(
                top: 0,
                left: 20,
                right: 0,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 36,
                      ),
                      Text(
                        '파머 D+11',
                        style: TextStyle(
                          color: FarmusThemeData.dark,
                          fontFamily: "Pretendard",
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '파머 님의 사랑으로\n오늘도 쑥쑥 자라는 중',
                        style: TextStyle(
                          color: FarmusThemeData.dark,
                          fontFamily: "Pretendard-Semi-Bold",
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 215, // lettuce 이미지의 위치 조정
                child: Center(
                  child: SvgPicture.asset(
                    'assets/image/pepper.svg',
                  ),
                ),
              ),
              Positioned(
                top: 263,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/image/greenwave.svg',
                    width: 369,
                  ),
                ),
              ),
              Positioned(
                top: 263,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/image/darkwave.svg',
                    width: 369,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
