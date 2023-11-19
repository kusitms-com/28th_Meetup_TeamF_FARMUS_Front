import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/register/register_screen.dart';

class HomeGreenBox extends StatelessWidget {
  const HomeGreenBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double adjust = 30.0;
    return Center(
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
            const Positioned(
              top: 15,
              left: 40,
              child: Text(
                '텃밭에서 식탁까지\n팜어스와 늘 함께해요!',
                style: TextStyle(
                    color: FarmusThemeData.dark,
                    fontFamily: "Pretendard-Semi-Bold",
                    fontSize: 20),
              ),
            ),
            const Positioned(
              top: 90,
              left: 40,
              child: Text(
                '파머 님께 추천하는 채소예요\n채소를 등록하고 홈파밍을 시작해볼까요?',
                style: TextStyle(
                    color: FarmusThemeData.dark,
                    fontFamily: "Pretendard",
                    fontSize: 12),
              ),
            ),
            Positioned(
              top: 165 + adjust,
              left: 50,
              child: SvgPicture.asset(
                'assets/image/lettuce.svg',
              ),
            ),
            Positioned(
              top: 175 + adjust,
              left: 135,
              child: SvgPicture.asset(
                'assets/image/basil.svg',
              ),
            ),
            Positioned(
              top: 160 + adjust,
              left: 215,
              child: SvgPicture.asset(
                'assets/image/greenonion.svg',
              ),
            ),
            Positioned(
              top: 163 + adjust,
              left: 300,
              child: SvgPicture.asset(
                'assets/image/pepper.svg',
              ),
            ),
            Positioned(
              top: 240 + adjust,
              child: SvgPicture.asset(
                'assets/image/smallbox.svg',
                width: 369,
              ),
            ),
            const Positioned(
              top: 245 + adjust,
              left: 70,
              child: Text(
                '상추',
                style: TextStyle(
                    fontSize: 12,
                    color: FarmusThemeData.dark,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Positioned(
              top: 245 + adjust,
              left: 155,
              child: Text(
                '바질',
                style: TextStyle(
                    fontSize: 12,
                    color: FarmusThemeData.dark,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Positioned(
              top: 245 + adjust,
              left: 245,
              child: Text(
                '파',
                style: TextStyle(
                    fontSize: 12,
                    color: FarmusThemeData.dark,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Positioned(
              top: 245 + adjust,
              left: 320,
              child: Text(
                '고추',
                style: TextStyle(
                    fontSize: 12,
                    color: FarmusThemeData.dark,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              top: 270 + adjust,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const RegisterScreen()), //페이지 수정하기
                  );
                },
                child: SvgPicture.asset(
                  'assets/image/vege_regi_btn.svg',
                  width: 100,
                  height: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
