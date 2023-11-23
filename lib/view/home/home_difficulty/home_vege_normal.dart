import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/register/register_screen.dart';

class HomeVegeNormal extends StatelessWidget {
  final String? name;
  const HomeVegeNormal({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double adjust = 30.0;
    const double boxWidth = 470; // Width of the outer SizedBox
    const double imageSpacing = 90; // Spacing between the two images
    const double vege1Width = 78; // Example width
    const double vege2Width = 78; // Example width
    const double label1Width = 20;
    const double label2Width = 10;

    const double vege1Left = (boxWidth / 2) - imageSpacing - (vege1Width / 2);

    const double vege2Left = (boxWidth / 2);

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
           Positioned(
              top: 90,
              left: 40,
              child: Text(
                '${name}' +'님께 추천하는 채소예요\n채소를 등록하고 홈파밍을 시작해볼까요?',
                style: TextStyle(
                    color: FarmusThemeData.dark,
                    fontFamily: "Pretendard",
                    fontSize: 12),
              ),
            ),
            Positioned(
              top: 157 + adjust,
              left: vege1Left,
              child: SvgPicture.asset(
                'assets/image/basil.svg',
                height: 100,
                width: 78,
              ),
            ),
            Positioned(
              top: 142 + adjust,
              left: vege2Left, //215,
              child: SvgPicture.asset(
                'assets/image/sesame_col.svg',
                height: 104,
                width: 78,
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
              left: vege1Left + (vege1Width / 2) - (label1Width / 2),
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
              left: vege2Left + (vege2Width / 2) - (label2Width / 2),
              child: Text(
                '깻잎',
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
                            RegisterScreen(

                            )), //페이지 수정하기
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
