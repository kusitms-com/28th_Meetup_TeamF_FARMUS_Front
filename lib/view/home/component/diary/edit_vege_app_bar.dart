import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';

class EditAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;

  const EditAppBar({Key? key, this.title}) : super(key: key);

  @override
  State<EditAppBar> createState() => _EditAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _EditAppBarState extends State<EditAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title != null
          ? Text(
              widget.title!,
              style: const TextStyle(
                color: FarmusThemeData.dark,
                fontFamily: "Pretendard",
                fontSize: 16,
              ),
            )
          : null,
      centerTitle: true,
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/image/ic_close.svg'),
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
