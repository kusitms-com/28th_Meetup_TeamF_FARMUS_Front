import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_setting_text.dart';
import 'package:mojacknong_android/view/my_page/history/my_page_setting_web.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

//설정
class MyPageSettingScreen extends StatefulWidget {
  const MyPageSettingScreen({super.key});

  @override
  State<MyPageSettingScreen> createState() => _MyPageSettingScreenState();
}

class _MyPageSettingScreenState extends State<MyPageSettingScreen> {
  final BottomSheetController _controller = Get.put(BottomSheetController());

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: "설정"),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyPageSettingText(
            text: "개인정보 처리 방침",
            onPress: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const MyPageSettingWeb(
                    url:
                    "https://www.notion.so/FARMUS-5a883da34dd14ff594e952b470dd19f6?pvs=4"),
              ));
            },
          ),
          const Divider(
            color: FarmusThemeData.grey4,
            indent: 16,
            endIndent: 16,
          ),
          MyPageSettingText(
            text: "서비스 이용약관",
            onPress: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const MyPageSettingWeb(
                    url:
                    "https://www.notion.so/FARMUS-b479368ce7e64145943e39d2162e7166?pvs=4"),
              ));
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            thickness: 12,
            color: FarmusThemeData.dividerBackground,
          ),
          const SizedBox(
            height: 16,
          ),
          MyPageSettingText(
            text: "로그아웃",
            onPress: () {
              _controller.showActionSheetRedMessage(
                context,
                message: "로그아웃하시겠어요?",
                confirmText: "로그아웃하기",
                cancelButtonText: "취소",
              );
            },
          ),
          const Divider(
            color: FarmusThemeData.grey4,
            indent: 16,
            endIndent: 16,
          ),
          MyPageSettingText(
            text: "탈퇴하기",
            onPress: () {
              _controller.showCustomCupertinoActionSheet(context,
                  message: "팜어스를 탈퇴하시겠어요?",
                  options: [
                    "채소/팜클럽 히스토리가 모두 사라져요\n\n미션/루틴을 체크할 수 없어요\n\n성장일기가 모두 사라져요\n\n커뮤니티 소식을 받을 수 없어요",
                    "탈퇴하기"
                  ],
                  cancelButtonText: "취소");
            },
          ),
          const Divider(
            color: FarmusThemeData.grey4,
            indent: 16,
            endIndent: 16,
          ),
        ],
      ),
    );
  }
}