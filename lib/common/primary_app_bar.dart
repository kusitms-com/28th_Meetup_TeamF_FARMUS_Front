import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BottomSheetController _controller = Get.put(BottomSheetController());

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
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/image/ic_more_vertical.svg"),
          onPressed: () {
            _controller.showCustomCupertinoActionSheet(context,
                message: "글 메뉴",
                options: ["수정", "삭제", "URL 공유"],
                cancelButtonText: "취소");
          },
        ),
      ],
      elevation: 0,
      backgroundColor: FarmusThemeData.white,
    );
  }
}
