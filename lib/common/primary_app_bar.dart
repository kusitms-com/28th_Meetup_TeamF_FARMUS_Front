import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/image/ic_arrow_left.svg",
          height: 24, // 원하는 크기로 조정
          width: 24, // 원하는 크기로 조정
        ),
        onPressed: () {
          Navigator.of(context).pop(); // 뒤로 가기 기능
        },
      ),
      actions: [],
      elevation: 0,
      backgroundColor: FarmusThemeData.white,
    );
  }
}
