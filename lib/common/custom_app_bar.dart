import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  CustomAppBar({this.title});

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        elevation: 0,
        leading: const BackButton(
          color: FarmusThemeData.black,
        ),
        title: title != null
            ? Text(
                title!,
                style: TextStyle(
                  color: FarmusThemeData.dark,
                  fontFamily: "Pretendard",
                  fontSize: 16,
                ),
              )
            : null,
        backgroundColor: FarmusThemeData.white,
      ),
    );
  }
}
