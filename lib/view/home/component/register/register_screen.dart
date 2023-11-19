import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/register/customs/calender.dart';
import 'package:mojacknong_android/view/home/component/register/customs/register_app_bar.dart';
import 'package:mojacknong_android/view/home/component/register/customs/register_button.dart';
import 'package:mojacknong_android/view/home/component/register/nickname_vege.dart';
import 'package:mojacknong_android/view/home/component/register/select_vege.dart';
import 'package:mojacknong_android/view/home/home_screen.dart';
import 'package:mojacknong_android/view_model/controllers/bottom_sheet_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RegiCustomAppBar(),
      backgroundColor: FarmusThemeData.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 230),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const Text(
                    '등록할 채소를 선택해주세요',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 300,
                  child: RegisterVege(),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: const Text(
                    '채소의 별명을 입력해주세요',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                  child: NickNameVege(),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: const Text(
                    '키우기 시작한 날을 선택해주세요',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const CustomCalendar(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: RegisterButton(
              text: '등록하기',
              onPressed: () async {
                BottomSheetController().showRegisterDialog(
                    context, "상훈이"); //context에는 입력한 채소 별명이 떠야함

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const HomeScreen()), //home screen으로 가고 이때 작물이 존재하는 상태니, home screen에서 swipescreen호출
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
