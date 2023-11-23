import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class BottomSheetFarmClubFinal extends StatelessWidget {
  final String imagePath;
  final String textContent;

  const BottomSheetFarmClubFinal({
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
              const SizedBox(width: 10),
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
          const SizedBox(height: 40),
          SvgPicture.asset(
            imagePath,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 100,
          ),
          const SizedBox(height: 12),
          const Text(
            "상추 좋아하세요",
            style: TextStyle(fontSize: 16, color: FarmusThemeData.grey1),
          ),
          const SizedBox(height: 60),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                'assets/image/final_rec.png',
              ),
              Positioned(
                top: 40,
                child: Text(
                  textContent,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: FarmusThemeData.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const FarmClearButton(text: '팜클럽 마치기'),
        ],
      ),
    );
  }
}

class FarmClearButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? surfaceTintColor;

  const FarmClearButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor = FarmusThemeData.brownButton,
    this.foregroundColor = FarmusThemeData.brownButton,
    this.surfaceTintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 340,
          height: 48,
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              foregroundColor: MaterialStateProperty.all(foregroundColor),
              side: MaterialStateProperty.resolveWith(
                (states) {
                  return BorderSide(
                    color: surfaceTintColor != null
                        ? surfaceTintColor!
                        : FarmusThemeData.brownButton,
                    width: 1.0,
                  );
                },
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                  color: FarmusThemeData.dark,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
