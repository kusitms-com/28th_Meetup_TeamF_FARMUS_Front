import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/diary/edit_vege_info.dart';
import 'package:mojacknong_android/view/home/component/register/controller/buttom_sheet_home.dart';

class DiaryAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DiaryAppBar({Key? key}) : super(key: key);

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
                    // "삭제하기" 옵션은 여기에 구현하기
                  },
                ],
              );
            },
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
