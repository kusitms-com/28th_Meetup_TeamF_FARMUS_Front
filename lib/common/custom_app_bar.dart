import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [],
      elevation: 0,
      leading: const BackButton(
        color: FarmusThemeData.black,
      ),
      backgroundColor: FarmusThemeData.white,
    );
  }
}
