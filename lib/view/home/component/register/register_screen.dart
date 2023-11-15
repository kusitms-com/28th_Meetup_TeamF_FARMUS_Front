import 'package:flutter/material.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/home/component/register/customs/register_app_bar.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: const Text(
              '등록할 채소를 선택해주세요',
              style: TextStyle(
                color: Colors.black, // 원하는 텍스트 색상으로 변경
                fontSize: 14.0, // 원하는 텍스트 크기로 변경
              ),
            ),
          ),
          const SizedBox(
            height: 320, // Replace with the desired height
            child: RegisterVege(),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: const Text(
              '채소의 별명을 입력해주세요',
              style: TextStyle(
                color: Colors.black, // 원하는 텍스트 색상으로 변경
                fontSize: 14.0, // 원하는 텍스트 크기로 변경
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: const Text(
              '키우기 시작한 날을 선택해주세요',
              style: TextStyle(
                color: Colors.black, // 원하는 텍스트 색상으로 변경
                fontSize: 14.0, // 원하는 텍스트 크기로 변경
              ),
            ),
          ),
        ],
      ),
    );
  }
}
