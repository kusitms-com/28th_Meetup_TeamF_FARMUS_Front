import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class HistoryHeader extends StatelessWidget {
  final String historyType;
  //final VoidCallback onMoreTap; // '더보기' 버튼 클릭 이벤트를 처리할 콜백
  // 미완성

  const HistoryHeader({
    Key? key,
    required this.historyType,
    //required this.onMoreTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                historyType,
                style: const TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                // This will push the following widgets to the far right
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      '더보기',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: FarmusThemeData.grey1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Action when the button is pressed
                      },
                      icon: SvgPicture.asset(
                        "assets/image/arrow_right_mypage.svg",
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: FarmusThemeData.grey2, // 선의 색상
          height: 1,
          thickness: 1,
          indent: 16.0,
          endIndent: 16.0,
        ),
      ],
    );
  }
}
