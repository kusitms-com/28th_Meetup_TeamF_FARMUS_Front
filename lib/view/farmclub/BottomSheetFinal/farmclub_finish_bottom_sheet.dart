import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/BottomSheetFinal/farm_clear_buttton.dart';

class BottomSheetFarmClubClear extends StatelessWidget {
  final String imagePath;
  final String textContent;

  const BottomSheetFarmClubClear({
    super.key,
    required this.imagePath,
    required this.textContent,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('assets/image/partycorn.svg'),
              const SizedBox(width: 8),
              const Text(
                "팜클럽 미션을 모두 완료했어요",
                style: TextStyle(
                    fontSize: 20,
                    color: FarmusThemeData.dark,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset('assets/image/partycorn.svg'),
            ],
          ),
          const SizedBox(height: 50),
          SvgPicture.asset(
            imagePath,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 100,
          ),
          const SizedBox(height: 8),
          const Text(
            "상추 좋아하세요",
            style: TextStyle(fontSize: 16, color: FarmusThemeData.grey1),
          ),
          const SizedBox(height: 20),
          SizedBox(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  child: Image.asset(
                    'assets/image/final_background.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Text(
                    textContent,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: FarmusThemeData.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Positioned(
                    top: 240, child: FarmClearButton(text: '팜클럽 마치기'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}