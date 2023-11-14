import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/farmclub/farmclub_search_screen.dart';

class ButtonToSearch extends StatelessWidget {
  const ButtonToSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return FarmclubSearchScreen();
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: FarmusThemeData.background,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/image/ic_search_small.svg"),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "팜클럽을 검색해 보세요",
              style: TextStyle(
                color: FarmusThemeData.grey3,
                fontFamily: "Pretendard",
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
