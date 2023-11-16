import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class ImageWidget extends StatelessWidget {
  final String blackPath;
  final String colPath;
  final bool isSelected;
  final Function onTap;
  final String veggieName;
  final String difficulty;

  const ImageWidget({
    Key? key,
    required this.blackPath,
    required this.colPath,
    required this.isSelected,
    required this.onTap,
    required this.veggieName,
    required this.difficulty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double boxWidth = 108.0;
    const double imageWidth = 75.0;

    return GestureDetector(
      onTap: () => onTap(),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/image/gray_box.svg',
              width: boxWidth,
              height: boxWidth,
            ),
          ),
          if (isSelected)
            Positioned(
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/image/selected_box.svg',
                width: boxWidth,
                height: boxWidth,
              ),
            ),
          Positioned(
            child: Center(
              child: isSelected
                  ? SvgPicture.asset(
                      colPath,
                      width: imageWidth,
                      height: imageWidth,
                    )
                  : SvgPicture.asset(
                      blackPath,
                      width: imageWidth,
                      height: imageWidth,
                    ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '$veggieName  |  $difficulty',
                style: const TextStyle(
                  color: FarmusThemeData.dark,
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
