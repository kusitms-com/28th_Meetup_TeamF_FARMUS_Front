import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class HomeCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeCustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [],
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 70),
          Expanded(
            child: Center(
              child: SvgPicture.asset(
                'assets/image/logo_farmus.svg',
                width: 88,
                height: 19,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/image/ic_plus.svg',
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/image/ic_alarm.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: FarmusThemeData.white,
    );
  }
}
