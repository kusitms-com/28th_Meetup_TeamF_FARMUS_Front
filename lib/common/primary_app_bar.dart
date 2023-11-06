import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BottomSheetController _controller = Get.put(BottomSheetController());
  final Widget? leading;
  final List<Widget>? actions;

  PrimaryAppBar({this.leading, this.actions});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/image/ic_arrow_left.svg",
          height: 24,
          width: 24,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: actions,
      elevation: 0,
      backgroundColor: FarmusThemeData.white,
    );
  }
}
