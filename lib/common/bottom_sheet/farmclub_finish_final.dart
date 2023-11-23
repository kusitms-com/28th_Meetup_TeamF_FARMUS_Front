import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/bouncing.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class BottomSheetFarmClubFinal extends StatelessWidget {
  final String imagePath;
  final String title;
  final String textContent;

  const BottomSheetFarmClubFinal({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.textContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate dynamic padding based on screen height
    double dynamicPadding = MediaQuery.of(context).size.height * 0.1;

    return Container(
      width: double.infinity,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: dynamicPadding),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/image/partycorn.svg'),
                      const SizedBox(width: 8),
                      const Text(
                        "팜클럽 미션을 모두 완료했어요",
                        style: FarmusThemeData.darkStyle20,
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/image/partycorn.svg'),
                    ],
                  ),
                  const SizedBox(height: 64),
                  Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    title,
                    style: FarmusThemeData.grey1Style16,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    'assets/image/final2.png',
                  ),
                  Positioned(
                    bottom: 64,
                    child: Column(
                      children: [
                        Text(
                          textContent,
                          textAlign: TextAlign.center,
                          style: FarmusThemeData.whiteStyle14,
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        FarmClearButton(text: '팜클럽 마치기'),
                      ],
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
          height: 60,
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
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
