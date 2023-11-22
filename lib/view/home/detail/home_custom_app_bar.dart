import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/register/register_screen.dart';

class HomeCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeCustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/image/logo_farmus.svg',
              width: 88,
              height: 19,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/image/ic_math-plus.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: FarmusThemeData.white,
    );
  }
}
