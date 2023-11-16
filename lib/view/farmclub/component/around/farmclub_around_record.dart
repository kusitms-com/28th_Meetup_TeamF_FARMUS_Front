import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class FarmclubAroundRecord extends StatelessWidget {
  const FarmclubAroundRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 156,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: FarmusThemeData.grey4, // 테두리 색상
            width: 1.0, // 테두리 두께
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/image/ic_lock.svg",
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "팜클럽 멤버에게만 공개되어 있어요",
              style: FarmusThemeData.grey2Style13,
            ),
          ],
        ),
      ),
    );
  }
}
