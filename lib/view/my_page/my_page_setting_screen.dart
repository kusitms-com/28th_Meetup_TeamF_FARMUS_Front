import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/common/primary_app_bar.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_setting_text.dart';

class MyPageSettingScreen extends StatelessWidget {
  const MyPageSettingScreen({super.key});

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
          const Divider(
            thickness: 12,
            color: FarmusThemeData.dividerBackground,
          ),
          SizedBox(
            height: 16,
          ),
          MyPageSettingText(
            text: "로그아웃",
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
