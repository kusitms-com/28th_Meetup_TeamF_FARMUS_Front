import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class HomeFinalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final List<Widget>? actions;

  const HomeFinalAppBar({super.key, this.leading, this.title, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                color: FarmusThemeData.dark,
                fontFamily: "Pretendard",
                fontSize: 16,
              ),
            )
          : null,
      centerTitle: true,
      actions: [
        ...(actions ?? []),
        IconButton(
          icon: SvgPicture.asset(
            "assets/image/ic_close.svg",
            height: 24,
            width: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      elevation: 0,
      backgroundColor: FarmusThemeData.white,
    );
  }
}
