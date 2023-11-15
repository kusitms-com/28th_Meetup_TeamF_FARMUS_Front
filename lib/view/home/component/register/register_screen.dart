import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/register/customs/calender.dart';
import 'package:mojacknong_android/view/home/component/register/customs/dialog.dart';
import 'package:mojacknong_android/view/home/component/register/customs/register_app_bar.dart';
import 'package:mojacknong_android/view/home/component/register/customs/register_button.dart';
import 'package:mojacknong_android/view/home/component/register/nickname_vege.dart';
import 'package:mojacknong_android/view/home/component/register/select_vege.dart';

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
                  height: 320,
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
              onPressed: () {
                RegisterDialog.flutterDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
