import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_setting_text.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class MyPageSettingScreen extends StatefulWidget {
  const MyPageSettingScreen({super.key});

  @override
  State<MyPageSettingScreen> createState() => _MyPageSettingScreenState();
}

class _MyPageSettingScreenState extends State<MyPageSettingScreen> {
  BottomSheetController _controller = Get.put(BottomSheetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "설정"),
      backgroundColor: FarmusThemeData.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyPageSettingText(
            text: "푸시알림",
          ),
          Divider(
            color: FarmusThemeData.grey4,
            indent: 16,
            endIndent: 16,
          ),
          MyPageSettingText(
            text: "개인정보 처리 방침",
          ),
          Divider(
            color: FarmusThemeData.grey4,
            indent: 16,
            endIndent: 16,
          ),
          MyPageSettingText(
            text: "서비스 이용약관",
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 12,
            color: FarmusThemeData.dividerBackground,
          ),
          SizedBox(
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
          Divider(
            color: FarmusThemeData.grey4,
            indent: 16,
            endIndent: 16,
          ),
          MyPageSettingText(
            text: "탈퇴하기",
          ),
          Divider(
            color: FarmusThemeData.grey4,
            indent: 16,
            endIndent: 16,
          ),
        ],
      ),
    );
  }
}
