import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class SearchEdit extends StatelessWidget {
  const SearchEdit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: FarmusThemeData.background,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/image/ic_search_small.svg"),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "팜클럽을 검색해 보세요",
                  hintStyle: TextStyle(
                    color: FarmusThemeData.grey3,
                    fontFamily: "Pretendard",
                    fontSize: 14,
                  ),
                ),
                cursorColor: FarmusThemeData.grey1,
                autofocus: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
