import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';

class RegiCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RegiCustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PrimaryAppBar(
          title: "채소 등록",
        ),
        backgroundColor: FarmusThemeData.white);
  }
}
