import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojacknong_android/common/farmus_theme_data.dart';
import 'package:mojacknong_android/view/my_page/component/my_page_bar.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Replace the appBar property with a direct call to your custom app bar widget
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
            kToolbarHeight), // Set the height of the app bar
        child: MyPageAppBar(
          title: '프로필 수정',
          onBackButtonPressed: () {
            Navigator.of(context)
                .pop(); // Custom action when the back button is pressed
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Text(
                '프로필 사진과 닉네임을 등록해주세요',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 40),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: SvgPicture.asset(
                    'assets/image/ic_profile.svg',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                " 닉네임",
                style: TextStyle(
                    color: FarmusThemeData.dark,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 42,
                child: Stack(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: FarmusThemeData.grey4),
                        ),
                        hintText: '이름을 입력해주세요',
                        hintStyle: TextStyle(
                            fontSize: 13, color: FarmusThemeData.grey3),
                        contentPadding:
                            EdgeInsets.only(left: 8, top: 5, right: 30),
                        counterText: "", // counter 숨겨주고, maxLength까지만 입력가능하게
                      ),
                      maxLength: 10,
                      onChanged: (text) {
                        if (text.length <= 10) {
                          setState(() {
                            inputText = text;
                          });
                        }
                      },
                    ),
                    Positioned(
                      right: 8, // textfield 안 padding
                      top: 12,
                      child: Text(
                        '${inputText.length}/10',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                " 특수문자는 입력할 수 없어요",
                style: TextStyle(
                    color: FarmusThemeData.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 150),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: inputText.isEmpty
                        ? const Color(0xffc5c5c5)
                        : FarmusThemeData.brownButton,
                    minimumSize:
                        const Size(double.infinity, 50), // 버튼의 최소 크기 설정
                  ),
                  onPressed: inputText.isEmpty
                      ? null
                      : () {
                          // 프로필 정보 저장 로직
                        },
                  child: const Text(
                    '확인',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
