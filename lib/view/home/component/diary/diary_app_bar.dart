import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/diary/edit_vege_info.dart';
import 'package:mojacknong_android/view/home/component/register/controller/buttom_sheet_home.dart';

import '../result/home_final_screen.dart';

class DiaryAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;

  const DiaryAppBar({Key? key, this.title}) : super(key: key);
  @override
  State<DiaryAppBar> createState() => _DiaryAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _DiaryAppBarState extends State<DiaryAppBar> {
  late final HomeBottomSheetController _homebottomSheetController =
      HomeBottomSheetController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            onPressed: () {
              print("Default Kebab Tapped!");
              _homebottomSheetController.showCustomCupertinoActionSheet(
                context,
                options: ["채소 정보 수정하기", "채소 삭제하기"],
                cancelButtonText: "취소",
                optionsAction: [
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditVegeInfo()),
                    );
                  },
                  () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const HomeFinalScreen()
                    ),
                    );
                  },
                ],
              );
            },
            icon: SvgPicture.asset('assets/image/ic_onkebab.svg'),
          ),
        ],
        elevation: 0,
        backgroundColor: FarmusThemeData.white,
      ),
    );
  }
}
