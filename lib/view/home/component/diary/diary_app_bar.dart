import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class DiaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiaryAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/image/ic_onkebab.svg'),
          ),
        ],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/image/ic_arrow_left.svg'),
        ),
        backgroundColor: FarmusThemeData.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 105),
            Text(
              '성장 일기',
              style: TextStyle(
                color: FarmusThemeData.dark,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
