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
    return GestureDetector(
      onTap: () => onTap(),
      child: Stack(
        children: [
          Positioned(
            left: 13,
            child: SvgPicture.asset(
              'assets/image/gray_box.svg',
              width: 108,
              height: 108,
            ),
          ),
          if (isSelected)
            Positioned(
              left: 13,
              child: SvgPicture.asset(
                'assets/image/selected_box.svg',
                width: 108,
                height: 108,
              ),
            ),
          Positioned.fill(
            bottom: 5,
            child: Center(
              child: isSelected
                  ? SvgPicture.asset(
                      colPath,
                      width: 75,
                      height: 75,
                    )
                  : SvgPicture.asset(
                      blackPath,
                      width: 75,
                      height: 75,
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
